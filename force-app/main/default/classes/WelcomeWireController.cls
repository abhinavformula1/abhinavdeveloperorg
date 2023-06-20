public with sharing class WelcomeWireController {

    public WelcomeWireController() {

    }

    @AuraEnabled(cacheable=true)
    public static LIst<Account> getAccount(){
        try {   
            List<Account> listAccount= [SELECT Id, Name from Account];
                return listAccount;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}