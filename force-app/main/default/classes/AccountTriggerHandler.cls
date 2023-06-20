public class AccountTriggerHandler {
    
    public Static void deleteContactwithSameAccoutName(List<Account> listAccount){
        Set<String> accName = new Set<String>();
        for(Account ac : listAccount){
            accName.add(ac.Name);
        }
        
        List<Contact> listContact = [Select Id, Name from Contact WHERE Name =: accName];
        
        if(listContact.size()>0 && listContact != Null){
            delete listContact;
        }
    }
    
    public static void createContactandOpportunity(List<Account> listAccount){
        List<Contact> listContact = new List<Contact>();
        List<Opportunity> listOpportunity = new List<Opportunity>();
        
        for(Account acc : listAccount){
            
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = 'Account Child' + acc.name;
            listContact.add(con);
            
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.Id;
            opp.Name='Account Child' + acc.name;
            opp.StageName='Closed Won';
            opp.CloseDate=System.Today()+7;
            listOpportunity.add(opp);
        }
        insert listContact;
        insert listOpportunity;
    }
    
    //Why this is after update and not before update
    public static void updateContactOtherStreet(List<Account> oldListAccount, List<Account> newListAccount){
        
        for(Account acc : newListAccount){
            if(oldListAccount[0].billingstreet != acc.BillingStreet){
				List<Contact> listContact = [Select Id, Name , AccountId,OtherStreet from Contact where AccountId =: acc.Id];
                for(Contact con: listContact){
                    con.OtherStreet = acc.BillingStreet;
                    update con;
                }
            }
        }
        
    }
}