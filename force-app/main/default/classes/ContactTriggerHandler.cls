public class ContactTriggerHandler {
    
    public static void updateAccountPhoneNumber(Map<Id,Contact> mapOldContact, Map<Id,Contact> mapNewContact){
        
        List<Account> updatelistAccount = new List<Account>();
        List<Account> listAccount = new List<Account>();
        Set<Id> contactId = new Set<Id>();
        
        for(Contact con : mapNewContact.values()){
            if(mapOldContact.get(con.Id).Phone != con.Phone){
                contactId.add(con.Id);
            }
        }
        
        listAccount = [SELECT Id, Name , Phone, (Select Id, Name, Phone from Contacts where Id =: contactId) from Account];
        
        for(Account acc: listAccount){
            for(Contact con : acc.Contacts){
                acc.Phone=con.Phone;
                updatelistAccount.add(acc);
            }
        }
        update updatelistAccount;
    }
    
    public static void updateContactCountOnAccount(Map<Id,Contact> mapOldContact, Map<Id,Contact> mapNewContact){
        
        //Get the Account Id for the Contact
        
        Set<Id> AccId = new Set<Id>();
        
        if(trigger.isDelete){
            for(Contact con : mapOldContact.values()){
                AccId.add(con.AccountId);
            }
        }
        
        if(trigger.isInsert || trigger.isUpdate){
            for(Contact con : mapNewContact.values()){
                AccId.add(con.AccountId);
            }
        }
        
        System.debug('Account Id '+AccId);
        
        //find out the contacts for the account
        List<Contact> listContact = [Select Id, Name, AccountId from Contact where  AccountId =: AccId];
        
        //Update the count of the Contact on the Account
        
        List<Account> listAccount = [Select Id, Name ,Number_Of_Contacts__c, (Select Id, Name, AccountId from Contacts) from Account where Id =: AccId];
        List<Account> updateAccount = new List<Account>();
        for(Account ac : listAccount){
            ac.Number_Of_Contacts__c = ac.contacts.size();
            updateAccount.add(ac);
        }
        update updateAccount;
        
    }
}