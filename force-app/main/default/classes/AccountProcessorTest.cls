@isTest
public class AccountProcessorTest {
	
    @isTest static void countContactsTest(){
        Account acc1 = new Account(Name='Acc1');
        Account acc2 = new Account(Name='Acc2');
        List<Account> listAccount = new List<Account>();
        listAccount.add(acc1);
        listAccount.add(acc2);
        insert listAccount;
        List<Id> AccountIds = new List<Id>();
        AccountIds.add(listAccount[0].Id);
        Test.startTest();
        AccountProcessor.countContacts(AccountIds);
        Test.stopTest();
    }
}