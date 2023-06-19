public with sharing class SObjectUntility {
    
    public static void nRecords(Integer number){
    
        List<Account> lstAccount = new List<Account>();
    
            while(number >= 0){
                
                Account acct = new Account();
                acct.Name = 'Acount Name'+number;
                acct.AccountNumber = 'A000 '+ number;
                lstAccount.add(acct);
                number--;
            }
            Datebase.insert lstAccount;
    }


    public static void findUniqueString(){

        List<String> City = new List<String>{'Banalore','Hydrabad','Pune','Delhi'};

        List<Country__c> uniqueCity = [SELECT COUNT_DISTINCT(City__c) FROM Country__c];
    }
}