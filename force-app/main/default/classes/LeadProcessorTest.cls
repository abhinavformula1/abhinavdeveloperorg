@isTest
private class LeadProcessorTest {
    @isTest
    private static void updateLeadSource(){
        List<Lead> lstLead = new List<Lead>();
        for(Integer i = 1; i<= 200; i++){
            lstLead.add(new Lead(LastName='Lead'+i, Company='Salesforce'));
        }
        insert lstLead;
        Test.startTest();
    	LeadProcessor lp = new LeadProcessor();
    	Id batchId = Database.executeBatch(lp);
    	Test.stopTest();
    } 
}