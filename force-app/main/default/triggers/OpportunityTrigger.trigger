trigger OpportunityTrigger on Opportunity (after update) {
	//1. Whenever Opportunity Stage picklist values changes to 'Closed Won',
	//I want to create a Child Record (OpportunityLineItem) of this Opportunity.
	//2. Whenever I create a new Account, automatically I want to create  a Contact and an opportunities under this Account.
	//
    
    List<Opportunity_Child__c> listOppChild = new List<Opportunity_Child__c>();
    for(Opportunity opp : trigger.new){
        //If Privoius Stage != 'Closed Won' and Current Stage =='Closed Won'
        if(Trigger.oldMap.get(opp.Id).StageName != 'Closed Won' &&  opp.StageName=='Closed Won'){
            Opportunity_Child__c oppCh = new Opportunity_Child__c();
            oppCh.Opportunity__c = opp.Id;
            oppCh.Name = 'Child of ' +opp.Name;
            listOppChild.add(oppCh);
        }
    }
    insert listOppChild;
    
}