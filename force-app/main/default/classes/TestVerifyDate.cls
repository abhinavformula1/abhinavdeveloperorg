@isTest
public class TestVerifyDate {
    
    @istest static void TestCheckDates1(){
        Date d1 = Date.newInstance(2021, 12, 13);
        Date d2 = Date.newInstance(2021, 12, 13);
        VerifyDate.CheckDates(d1,d2);
    }
    @istest static void TestCheckDates2(){
        Date d1 = Date.newInstance(2021, 12, 13);
        Date d2 = Date.newInstance(2022, 12, 13);
        VerifyDate.CheckDates(d1,d2);
    }
}