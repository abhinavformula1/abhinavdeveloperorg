trigger SMSTrigger on SMS_Log__c (after insert , after undelete) {
	
  	  System.debug('@@@@ Trigger.Nw '+trigger.new[0].id);
  //  System.debug('@@@@ Trigger.Old '+trigger.old[0].id);

  if(Trigger.isInsert){
    SMSUtils.sendSMSAsync(Trigger.New[0].from__c, Trigger.New[0].to__c , Trigger.New[0].msg__c );
  }

}