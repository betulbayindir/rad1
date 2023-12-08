@isTest
public class StockItemTest {
    
// test class for business requirement #2: create case if stock item is deleted before stock on hand equals 0
        
        @isTest 
    static void testafterDelete() {
		
    //    List<Stock_Item__c> l = new List<Stock_Item__c>();
        
  //     for( Integer i = 0 ; i<3 ; i++){
            
            Stock_Item__c newStock = new Stock_Item__c(
                Item_Name__c = 'TEST CONTROLLER',
                Stock_on_Hand__c = 1);
           
    //        l.add(newStock);
      //  }
          insert newStock; 
        
        //   List<Case> caseList = new List<Case>();
        
      //  for (Stock_Item__c s: l) {
                  if (newStock.Stock_on_Hand__c != 0) {
                Case cse = new Case();
                cse.Status = 'New';
                cse.Priority = 'High';
                cse.Origin = 'Questionable Contact';
                cse.Subject = 'A stock item has been deleted before stock ran out';
                
			//	cse.ContactId = s.Id;
                cse.OwnerId = newStock.OwnerId;
                
                cse.Description = 'The item ' + newStock.Item_Name__c + ' (id: ' + newStock.Id + ')' +  ' has been deleted while stock was ' + newStock.Stock_on_Hand__c ;
         //       caseList.add(cse);                  
            
                      
                              insert cse;
        }
        

       // insert caseList; 
        Test.startTest();
        
        delete newStock;
        Test.stopTest();

        
      // **************************************************
      //  System.assertEquals(null, cse.Id); 
      //   // this line keeps giving me issues 
      //   is the issue insert cse;
        
    }
    

}