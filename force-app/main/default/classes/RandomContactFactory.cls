public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer numberofContact, String lName){
        
        List<Contact> listContact = new List<Contact>();
        
        for(Integer i=0; i<numberofContact;i++){
          	listContact.add(new Contact(FirstName = 'Tests '+ i ,LastName = lName));
        }
        
        return listContact;
    }

}