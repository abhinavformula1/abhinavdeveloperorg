trigger ContactTrigger on Contact (after update, after insert, after delete) {
    
    //1. If any contact's Phone Numer is updated , update the corresponding Account's Phone Number.
    
    if(trigger.isAfter){
        if(trigger.isUpdate){
            ContactTriggerHandler.updateAccountPhoneNumber(trigger.oldMap, trigger.newMap);
            ContactTriggerHandler.updateContactCountOnAccount(trigger.oldMap, trigger.newMap);
        }
        if(trigger.isInsert){
            ContactTriggerHandler.updateContactCountOnAccount(trigger.oldMap, trigger.newMap);
        }
        if(trigger.isDelete){
            ContactTriggerHandler.updateContactCountOnAccount(trigger.oldMap, trigger.newMap);
        }
    }
    
    
    
}