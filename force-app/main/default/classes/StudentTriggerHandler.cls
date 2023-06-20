public class StudentTriggerHandler {
    
    public static void updateDefaultStudentAddress(List<Student__c> listStudent){
     
        for(Student__c stud : listStudent){
            if(stud.Address__c == Null){
                stud.Address__c='India';
            }
        }
    }
    
    public static void updateStudentAddress(List<Student__c> listStudent){
        for(Student__c stud : listStudent){
            if(stud.Address__c == Null){
                stud.Address__c='Delhi';
            }
        }
    }
    
    public static void updateStudentSalutation(List<Student__c> listStudent){
        for(Student__c stud : listStudent){
            if(stud.Gender__c == 'Male'){
                stud.Name='Mr. '+stud.Name;
            }
            else if (stud.Gender__c == 'Female'){
                stud.Name='Mrs. '+stud.Name;
            }
            else{
                
            }
        }
    }
    
    public static void updateStudentFee(List<Student__c> listStudent){
        for(Student__c stud : listStudent){
            if(stud.Country__c == 'India'){
                stud.Fee__c=stud.Fee__c - (stud.Fee__c * 10)/100;
            }
        }
    }
    
   /* public static void studentShouldNotBeDeleted(List<Student__c> listStudent){
        for(Student__c stud : listStudent){
            stud.addError('Student Should Not Be Deleted');
        }       
    }*/
    
    public static void preventStudentDuplication(List<Student__c> listStudent){
        
       /* for(Student__c stud : listStudent){
            List<Student__c> st = [Select Id, name from Student__c where name =: stud.Name];
            if(st.size() > 0 && stud.Id == Null){
                stud.addError('Duplicate Name is Not Allowed');
            }
        }*/
        
        Set<String> sName = new Set<String>();
        
        for(Student__c stud : listStudent){
            sName.add(stud.Name);
        }
        
        List<Student__c> lStudent = [SELECT Id, Name from Student__c where Name =: sName];
        
        Map<String,Student__c> mapStud = new  Map<String,Student__c>();
        
        for(Student__c s : lStudent){
            mapStud.put(s.Name,s);
        }
        
        for(Student__c std : listStudent){
            if(mapStud.get(std.Name) != Null){
                std.addError('Duplicate Student');
            }
        }
        
    }
    
}