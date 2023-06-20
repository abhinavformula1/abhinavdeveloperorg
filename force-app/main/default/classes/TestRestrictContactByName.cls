@isTest
public class TestRestrictContactByName {

    @isTest static void TestRestrictContactByNameInvalid(){
        Contact c = new Contact(LastName='INVALIDNAME');
        Test.startTest();
        insert c;
        Test.stopTest();
        
    }
}