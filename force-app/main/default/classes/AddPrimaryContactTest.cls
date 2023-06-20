@isTest
public class AddPrimaryContactTest {
    
    public static List<Account> listAccount = new List<Account>();
    
    @testSetup
    public static void setup(){
        
        for(Integer i=1 ; i<=100; i++){
            Account acc = new Account(Name='Account '+i);
            if( i <51 ){
                acc.BillingState='NY';
            }
            else{
                acc.BillingState='CA';
            }
              listAccount.add(acc); 
        }
        
        insert listAccount;
    }
    
    static testMethod void test(){
        Contact c = new Contact(lastname='Kumar');
        insert c;
        AddPrimaryContact apc1 = new AddPrimaryContact(c, 'NY');
        Test.startTest();
        System.enqueueJob(apc1);
        Test.stopTest();
    }
}