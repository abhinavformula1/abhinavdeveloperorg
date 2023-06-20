public class StringArrayTest {

    public static List<String> generateStringArray(Integer num){
        
        List<String> testNet = new List<String>();
        
        for(Integer i=0 ; i < num ; i++){
            testNet.add('Test '+ i);
        }
        System.debug('Test My Method '+testNet);
        return testNet;
    }
}