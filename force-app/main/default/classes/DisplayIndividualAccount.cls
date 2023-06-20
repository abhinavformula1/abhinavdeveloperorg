public with sharing class DisplayIndividualAccount {
    
    public static void individualAccount(){
        System.debug('Total# of Account '+ [Select count() from Account] + ' Account Records '+ [Select Id, Name from Account] );
    }
}