public class AddPrimaryContact Implements Queueable{
    
    private string stateAbb = '';
    private Contact con;
    
    public AddPrimaryContact(Contact contact, String stateAbbreviation){
        this.stateAbb=stateAbbreviation;
        this.con=contact;
    }
    
    public void execute(QueueableContext context){
        List<Account> listAccount = [select id, (select Id from contacts) from account where BillingState =: stateAbb];
        List<Contact> listContact = new List<Contact>();
        
        for(Account acc : listAccount){
            Contact c = con.clone();
            c.AccountId=acc.Id;
            listContact.add(c);
        }
        insert listContact;
    }
    
    
    
}