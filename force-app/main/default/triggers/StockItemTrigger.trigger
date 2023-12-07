trigger StockItemTrigger on Stock_Item__c (before insert, before delete) {

    //Instantiate StockItemHandler
    

    //Before Insert Handling
    if(Trigger.isInsert && Trigger.isBefore) {
        //call the class in your handler for before insert

        // I thought I could satify this requirement by comparing 'Name' field of existing records with the new one.
        // I used oldMap to compare the two, and if there was a match in the system it was supposed to fire an error to stop the user
        // I  also used the Trigger Exception method addError()
        // 
        // ERROR CODE ON UI>>>>>>>>>>> StockItemTrigger: execution of BeforeInsert caused by: System.NullPointerException: 
        // Attempt to de-reference a null object Trigger.StockItemTrigger: line 15, column 1   
        //
        // I realized I used oldMap with Trigger.isInsert...  this code would only work with ISUPDATE not isInsert. 
        //  because oldMap will pull up the previous 'Name' value of a new record BUT a new record does not have previous 'Name' values! 
       
        /*
        for(Stock_Item__c stockItem: Trigger.new){
            Stock_Item__c existingItems = Trigger.oldMap.get(stockItem.Item_Name__c);
            if(stockItem.Item_Name__c == existingItems.Item_Name__c){
                stockItem.addError('This stock item already exists in the system. Please update stock on the existing record.');
            }
		} */
              



//TRYING AGAIN USING SOQL AND LIST
        List<Stock_Item__c> existingItems = [SELECT Item_Name__c FROM Stock_Item__c];
        for(Stock_Item__c newItem : Trigger.new) {
            for(Stock_Item__c existingItem : existingItems) {
                if(existingItem.Item_Name__c == newItem.Item_Name__c) {
                    newItem.addError('This stock item already exists in the system. Please update stock on the existing record.');
                }
            }
        }
 		
            
        }

        
    //Before Delete Handling
    if(Trigger.isDelete && Trigger.isBefore) {
        //call the class in your handler for before delete
        
		// Before Stock Item is deleted, check if Stock_on_Hand__c = 0  
		// If not, create case:
		// indicate name of deleted item, id, and the number of stock on hand when it was deleted in the description
		
        
      	List<Case> newCases = new List<Case>(); // Creates a case if a stock item is deleted before stock has ran out.
        
             for (Stock_Item__c s: Trigger.old) {
            if (s.Stock_on_Hand__c != 0) {
                System.debug('CASE EXECUTED?'); // ?????????
                Case cse = new Case();
                cse.Status = 'New';
                cse.Priority = 'High';
                cse.Origin = 'Questionable Contact';
                cse.Subject = 'A stock item has been deleted before stock ran out';
                cse.ContactId = s.Id;
                cse.Description = 'The item ' + s.Item_Name__c + ' (id: ' + s.Id + ')' +  ' has been deleted while stock was ' + s.Stock_on_Hand__c ;
                newCases.add(cse);
            
        }
      
                }
        

       
              
        
   }
    /* 3. We need a method that can be called from elsewhere in our codebase called getLowStockItems
	This should return a list of all the Stock Items that have a stock on hand count at or below their minimum stock level.

	It should include the following fields for the Stock Items it returns:
	ID
	Item_Name__c
	Item_Stock_is_Low__c
	Minimum_Stock_Level__c
	Stock_on_Hand__c
	*/
    
    List<Stock_Item__c> getLowStockItems = [SELECT Id, Item_Name__c, Item_Stock_is_Low__c, Minimum_Stock_Level__c, Stock_on_Hand__c 
                                    FROM Stock_Item__c 
                                    WHERE Item_Stock_is_Low__c = true];
        
        
    }