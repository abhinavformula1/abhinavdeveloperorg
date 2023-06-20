public class AccountProcessor {
    
    @future(callout = false)
    public static void countContacts(List<Id> AccountId){
        List<Account> lstAccount = [SELECT Id,Number_Of_Contacts__c, (SELECT Id from Contacts) from Account where Id =: AccountId];
        List<Account> updateListAccount = new List<Account>();
        for(Account acct : lstAccount){
            acct.Number_Of_Contacts__c = acct.Contacts.size();
            updateListAccount.add(acct);
        }
        update updateListAccount;
    }
}