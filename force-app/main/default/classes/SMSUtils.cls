public class SMSUtils {
    /*
    // Call async from triggers, etc, where callouts are not permitted.
    @future
    public static void sendSMSAsync(String fromNbr, String toNbr, String m) {
        System.debug('Inside future method sendSMSAsyc');
        sendSMS('1','2','3');
    }
	@future    
    // Call from controllers, etc, for immediate processing
    public static void sendSMS(String fromNbr, String toNbr, String m) {
        System.debug('Inside utlility method sendSMS');
    }
*/

// Call async from triggers, etc, where callouts are not permitted.
@future(callout=true)
public static void sendSMSAsync(String fromNbr, String toNbr, String m) {
    String results = sendSMS(fromNbr, toNbr, m);
    System.debug('Testing SMS Log '+results);
}
// Call from controllers, etc, for immediate processing
public static String sendSMS(String fromNbr, String toNbr, String m) {
    // Calling 'send' will result in a callout
   // String results = SmsMessage.send(fromNbr, toNbr, m);
    insert new SMS_Log__c(to__c=toNbr, from__c=fromNbr, msg__c=results);
    return results;
}
}