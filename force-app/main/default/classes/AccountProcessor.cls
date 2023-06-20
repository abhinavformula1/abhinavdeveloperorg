public class AccountProcessor {
    
    @future(callout = false)
    public static void countContacts(List<Id> AccountIds){
        List<Account> listAccount = [SELECT Id, Name,Number_Of_Contacts__c, (SELECT Id, Name from Contacts) FROM Account WHERE Id In: AccountIds];
        List<Account> listAccountToUpdate = new List<Account>();
        for(Account acc : listAccount){
            acc.Number_Of_Contacts__c = acc.contacts.size();
            listAccountToUpdate.add(acc);
        }
        if(listAccountToUpdate.size()>0){
            update listAccountToUpdate;
        }
    }

}