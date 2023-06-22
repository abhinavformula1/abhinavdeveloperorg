public class DailyLeadProcessor Implements Schedulable {

    public static void execute(SchedulableContext sc){
       
        List<Lead> lstLead = [SELECT Id, LeadSource from Lead WHERE LeadSource = '' Order By Createddate desc LIMIT 200];
        List<Lead> updateListLead = new List<Lead>();

        for (Lead lead : lstLead){
            lead.LeadSource = 'Dreamforce';
            updateListLead.add(lead);
        }
        update updateListLead;
    }
}