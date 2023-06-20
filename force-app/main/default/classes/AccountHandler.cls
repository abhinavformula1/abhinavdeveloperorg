public with sharing class AccountHandler {
    
    public static void insertAccount(Integer numberOfNewAccounts){
        List<Account> addAccounts = new List<Account>();
        Account asdfsf = new Account();
        while(numberOfNewAccounts >= 0){
            
            Account acct = new Account();
            acct.Name = 'Acme Inc'+numberOfNewAccounts;
            acct.AccountNumber = 'A000 '+ numberOfNewAccounts;
            addAccounts.add(acct);
            numberOfNewAccounts--;
        }
        insert addAccounts;
        System.debug('Account List '+addAccounts);

    }
}