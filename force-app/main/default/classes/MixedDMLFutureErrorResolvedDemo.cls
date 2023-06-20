public class MixedDMLFutureErrorResolvedDemo{
    
    public static void showMixDMLError(){
        
        //First DML Operation
        Account a = new Account(Name='Acme');
        insert a;
    }
        
        //This next operation (insert a user with a role)
        //can't be mixed with the previous insert unless it is within a future method.
        //call future method to insert a user with a role.
  
        @future
        public static void createUser(){
            Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
            UserRole r = [SELECT Id FROM UserRole WHERE Name='COO'];
            
            // Create new user with a non-null role ID
            
            User u = new User(alias = 'test', email='test1@test.com',
                              emailencodingkey='UTF-8',lastname='pathToCode',languagelocalekey='en_US',
                              localesidkey='en_US',profileid=p.Id, userroleid=r.Id,
                              timezonesidkey='America/Los_Angeles',username='PathToCode1@test.com');
           insert u;
        }
    }