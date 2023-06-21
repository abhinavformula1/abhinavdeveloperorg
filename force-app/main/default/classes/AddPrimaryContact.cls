public class AddPrimaryContact Implements Queueable{

    private Contact contact;
    private String state;

    public AddPrimaryContact(Contact inputContact, String inputString){
        this.contact = inputContact;
        this.state = inputString;
    }

    public void execute(QueueableContext context){  

        List<Account> accounts = [SELECT Id FROM Account where BillingState =: state Limit 200];

        // Create empty list of Contact records
        List<Contact> contacts = new List<Contact>();

        //Iterate through the Account records

        for(Account acc : accounts){
            Contact contactClone = contact.clone();
            contactClone.AccountId = acc.Id;
            contacts.add(contactClone);
        }
        insert contacts;
    }
}