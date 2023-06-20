trigger ApplicationTrigger on Application__c (before insert , before update) {

    Map<String, Application__c> mapOfAdharandApplication = new Map<String, Application__c>();
    
    for(Application__c aap : Trigger.New){
        mapOfAdharandApplication.put(aap.Aadhar_Card_No__c, aap);
    }
    
    List<Aadhar_Card__c> listAad = [Select Id, Name,Address__c
                                    from Aadhar_Card__c
                                    where Name =: mapOfAdharandApplication.keySet()];
    
    for(Aadhar_Card__c app : listAad){
        Application__c a = mapOfAdharandApplication.get(app.Name);
        a.Address__c = app.Address__c;
    }

}