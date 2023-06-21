public class LeadProcessor implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start (Database.BatchableContext BC){
        return Database.getQueryLocator('[Select Id, Name, LeadSource from Lead]');
     }

    public void execute(Database.BatchableContext bc, List<Lead > scope){
        // process each batch of records
        for(Lead lead : scope){
            lead.LeadSource='LeadSource';
        }
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }

}