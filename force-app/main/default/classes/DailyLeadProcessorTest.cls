@isTest
public class DailyLeadProcessorTest {
	
    @testSetup
    public static void setup(){
        List<Lead> listLead =  new List<Lead>();
        for(Integer i=1 ; i<201; i++){
            listLead.add(new Lead(lastname='Kumar',company='tcs'));
        }
        insert listLead;
    }
    
    @isTest
    public static void test(){
        String CRON_EXP = '0 0 0 15 3 ? 2022';
        Test.startTest();
        String jobId = System.schedule('DailyLeadProcessor',CRON_EXP,new DailyLeadProcessor());
        Test.stopTest();
    }
}