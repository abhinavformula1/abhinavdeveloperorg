public class SMSUtils {
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
}