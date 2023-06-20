public with sharing class SObjectUntility {
    
    public static void nRecords(Integer numberOfRecords){
        
        List<Account> lstAccount = new List<Account>();
        
        while(numberOfRecords >= 0){
            
            Account acct = new Account();
            acct.Name = 'Acount Record '+numberOfRecords;
            acct.AccountNumber = 'A000 '+ numberOfRecords;
            lstAccount.add(acct);
            numberOfRecords--;
        }
        insert lstAccount;
    }
}