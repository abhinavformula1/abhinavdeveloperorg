public class ContactSearch {
	
    public Static List<Contact> searchForContacts(String str1 , String str2){
        
        List<Contact> listContact = [Select Id, Name from Contact WHERE LastName =: str1 and MailingPostalCode =: str2];
        
        return listContact;
    }

}