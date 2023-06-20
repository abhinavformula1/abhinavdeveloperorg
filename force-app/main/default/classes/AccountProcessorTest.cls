@IsTest
public class AccountProcessorTest {
    
    private static void countContactsTest(){
        
        //Load Test Data
        List<Account> accounts = new List<Account>();
        for(Integer i=0; i<300; i++){
            accounts.add(new Account(name='Test Account' + i));
        }
        insert accounts;
        
        List<Contact> contacts = new List<Contact>();
        List<Id> accountIds = new List<Id>();

        for(Account acc : accounts){
            contacts.add(new contact(FirstName=acc.Name, LastName='TestContact', AccountId=acc.Id));
            accountIds.add(acc.Id);
        }
        insert contacts;

        // Do the test

        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
  }
 
}