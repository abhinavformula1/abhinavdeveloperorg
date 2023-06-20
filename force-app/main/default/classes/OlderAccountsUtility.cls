public with sharing class OlderAccountsUtility {

    public void updateOlderAccounts() {
        // Get the 5 oldest accounts
        Account[] oldAccounts = [SELECT Id, Description FROM Account ORDER BY CreatedDate ASC LIMIT 5];
        // loop through them and update the Description field
        for (Account acct : oldAccounts) {
            acct.Description = 'Heritage Account';
        }
        System.debug('Last 5 Account Fetched ' + oldAccounts);
        // save the change you made
        update oldAccounts;
      }

      public void testSOQL(){
        List<Contact> listOfContacts = [SELECT FirstName, LastName FROM Contact LIMIT 2];
        system.debug(listOfContacts);

       // Get a list of all contacts with each contact's account name

       List<Contact> lstContact = [SELECT FirstName, LastName, Account.Name FROM Contact LIMIT 2];
       System.debug(lstContact);

      // For every account, return the account name and the name of each related contact.

      //Suppose we want only accounts that have a related contact with the last name Forbes. 
      
      List<Account> lstAccount = [Select Id, Name, (Select Id, Name, AccountId from contacts where lastname='Forbes') from Account where Id IN (SELECT AccountId FROM Contact WHERE LastName = 'Forbes')];
      System.debug(lstAccount);

      //“Get a list of all properties with the property address, picture, and assigned broker.”
      
      List<Property__c> lstPropertry = [SELECT Address__c, Picture__c, Broker__c FROM Property__c];

      //SELECT Address__c, Picture__c, Broker__r.Name FROM Property__c
      //SELECT City__c FROM Property__c
      //SELECT COUNT(City__c) FROM Property__c
      //SELECT COUNT_DISTINCT(City__c) FROM Property__c
      //SELECT MAX(Status__c), Broker__r.Name FROM Property__c GROUP BY Broker__r.Name

      //SELECT Status__c, Broker__r.Name FROM Property__c

      

      }
}