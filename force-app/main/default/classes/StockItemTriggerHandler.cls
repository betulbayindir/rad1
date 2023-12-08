public class StockItemTriggerHandler {

    //Handler Methods

    public static void onBeforeInsert(List<Stock_Item__c> newStockItems) {
        
/*        List<Stock_Item__c> existingItems = [SELECT Item_Name__c FROM Stock_Item__c];
        for(Stock_Item__c newItem : Trigger.new) {
            for(Stock_Item__c existingItem : existingItems) {
                if(existingItem.Item_Name__c == newItem.Item_Name__c) {
                    newItem.addError('This stock item already exists in the system. Please update stock on the existing record.');
                }
            }
        }
*/
        
    }

    public static void onAfterInsert(List<Stock_Item__c> newStockItems) {
        
    }

    public static void onBeforeUpdate(Map<Id, Stock_Item__c> oldStockItemMap, List<Stock_Item__c> updatedStockItems) {
        
    }

    public static void onAfterUpdate(List<Stock_Item__c> updatedStockItems) {
        
    }

    public static void onBeforeDelete(Map<Id, Stock_Item__c> oldStockItemMap) {
            /*  	List<Case> newCases = new List<Case>(); // Creates a case if a stock item is deleted before stock has ran out.
        
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
*/      
    }

    public static void onAfterDelete(List<Stock_Item__c> deletedStockItems) {
        
    }
}