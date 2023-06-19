public with sharing class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> lstAccount = [SELECT Id, Name,status, AnnualRevenue From Account];
        /*for(Account acct : lstAccount){
            String acctRev = acct.Name +':'+acct.AnnualRevenue;
            System.debug(acctRev);
        }*/

        List<Account> lstAccount = [SELECT Id, Name,status, AnnualRevenue 
                                        FROM Account
                                        WHERE AnnualRevenue < 0
                                        AND
                                        CreatedDate < LAST_N_DAYS:30
                                        LIMIT 500000];

        for(Account acct : lstAccount){
            status.status='Retired'
        }
        update lstAccount;
    }
}