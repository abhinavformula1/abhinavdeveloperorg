@isTest
private class LeadProcessorTest {
    
   @testSetup
    static void setUp(){
       // In the test class, insert 200 Lead records
       List<Lead> listLead = new List<Lead>();
        for(Integer i=1 ; i<=200; i++){
            listLead.add(new Lead(lastname='AB '+i,Company = 'AB'));
        }
        insert listLead;
    }
    
    @isTest
    static void test(){
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id BatchId = Database.executeBatch(lp);
        Test.stopTest();
    }
    

}