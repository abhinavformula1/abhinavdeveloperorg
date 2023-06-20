trigger StudentTrigger on Student__c (before insert,before update, before delete) {
    
    //1. While creating a new student, if they (Student) don’t provide address,
    //   then populate the default Address as ‘India’ and while updating populate the default Address as ‘Delhi’.
    //2. Based on the ‘Gender’, add the salutation on the Student Name.
    //3. Update (give discount) on fee based on country
    //4. No one should delete any Student Record
    //5. Write a trigger to prevent duplicate student records.
    
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            StudentTriggerHandler.updateDefaultStudentAddress(Trigger.New);
            StudentTriggerHandler.updateStudentSalutation(Trigger.New);
            StudentTriggerHandler.updateStudentFee(Trigger.New);
            StudentTriggerHandler.preventStudentDuplication(Trigger.New);
        }
        if(Trigger.isUpdate){
            StudentTriggerHandler.updateStudentAddress(Trigger.New);
            StudentTriggerHandler.preventStudentDuplication(Trigger.New);
        }
        if(Trigger.isDelete){
          //	StudentTriggerHandler.studentShouldNotBeDeleted(Trigger.old);
        }
        
        
    }
    
    
}