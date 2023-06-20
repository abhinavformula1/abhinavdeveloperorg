trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    List<Opportunity> oppList = new List<Opportunity>();
    List<Task> lstTask = new List<Task>();
    List<Opportunity> toProcess = [SELECT Id, StageName FROM Opportunity where Id =: Trigger.New];
    switch on Trigger.operationType {
        when AFTER_INSERT {
            for(Opportunity opp : toProcess){
                if(opp.StageName == 'Closed Won'){
                    Task task = new Task();
                    task.Subject = 'Follow Up Test Task';
                    task.WhatId = opp.Id;
                    lstTask.add(task);
                }
            }
            if(lstTask.size() > 0){
                insert lstTask; 
            }
            
        }
        when AFTER_UPDATE {
            for(Opportunity opp : toProcess){
                if(opp.StageName == 'Closed Won'){
                    Task task = new Task();
                    task.Subject = 'Follow Up Test Task';
                    task.WhatId = opp.Id;
                    lstTask.add(task);
                }
            }
            if(lstTask.size() > 0){
                insert lstTask; 
            }
        }
        
    }
}