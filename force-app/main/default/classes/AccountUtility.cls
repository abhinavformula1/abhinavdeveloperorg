public with sharing class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList = [SELECT
                                            Id, Name, AnnualRevenue
                                            From 
                                            Account];
        for(Account acct : accountsList){
            String acctRev = acct.Name +':'+acct.AnnualRevenue;
            System.debug(acctRev);
        }
    }
}