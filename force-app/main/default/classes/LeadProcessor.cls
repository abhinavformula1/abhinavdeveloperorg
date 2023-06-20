public class LeadProcessor Implements Database.Batchable<sObject>, Database.Stateful {
    
    public Integer recordsProcessed = 0;
    public Integer numberOfTransaction = 0;

    public Database.QueryLocator start(Database.BatchableContext bc){
        
        String query = 'Select Id, Name from Lead';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        numberOfTransaction = numberOfTransaction + 1;
        System.debug('Number of Transaction '+ numberOfTransaction);
        for(Lead ld : Scope){
            ld.LeadSource = 'Dreamforce';
            recordsProcessed = recordsProcessed + 1;
        }
        
        System.debug('Number of Records Processed '+ recordsProcessed);
    }
    
    public void finish(Database.BatchableContext bc){
        
    }
}