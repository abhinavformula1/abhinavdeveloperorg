public with sharing class ContactUtility {
    public static void viewContacts(){
        List<Contact> listOfContacts = [SELECT FirstName, LastName FROM Contact];
        //Exepected Output - First Name: <contact's first name>, Last Name: <contact's last name>
        for (Contact con : listOfContacts){
            //loop body
            String fullName = 'First Name: '+ con.FirstName + ', Last Name: ' + con.LastName;
            system.debug(fullName);
        }
    }
}