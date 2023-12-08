trigger StockItemTriggerClass on Stock_Item__c (before insert, before delete, after delete) {
    
   // DEACTIVATED for now
    
    if(Trigger.isBefore && Trigger.isInsert){
        
        StockItemTriggerHandler.onBeforeInsert(Trigger.new);
            
    }
    
       
     if(Trigger.isAfter && Trigger.isDelete){
        
         StockItemTriggerHandler.onAfterDelete(Trigger.old);
    }


}