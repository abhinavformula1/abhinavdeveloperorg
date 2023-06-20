trigger AccountTrigger on Account (before insert, after insert, after update) {
    
    //1. Whenever I am creating a new Account Record, If any Contact are existing with the same name I want to delete those contacts.
    //2. Whenever I create a new Account, automatically I want to create  a Contact and an opportunities under this Account.
    //3. Whenever I update any Billing Street field on Account record,  I want to update the corresponding contact' other street aswell.
    //4. After you delete any Account the correspong Contact and opportunity should also be deleted.
    
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            AccountTriggerHandler.deleteContactwithSameAccoutName(trigger.new);
        }
        if(Trigger.isUpdate){
            AccountTriggerHandler.updateContactOtherStreet(trigger.old, trigger.new);
        }
    }
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            AccountTriggerHandler.createContactandOpportunity(trigger.new);
        }
        if(Trigger.isUpdate){
            AccountTriggerHandler.updateContactOtherStreet(trigger.old, trigger.new);
        }
    }
    
}