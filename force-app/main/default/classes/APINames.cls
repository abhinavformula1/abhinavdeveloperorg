public class APINames {
    
    public List<SObjectType> getObjectsWithField(String apiName)
    {
       // System.debug('Inside getObjectsWithField');
        List<SObjectType> sObjectTypes = new List<SObjectType>();
        for (SObjectType sObjectType : Schema.getGlobalDescribe().values())
        {
         	System.debug('Objects Fields ==> ' + sObjectType);   
            if (sObjectType.getDescribe().fields.getMap().containsKey(apiName))
            {
               // System.debug('Inside getObjectsWithField If');
                sObjectTypes.add(sObjectType);
               // System.debug('Inside getObjectsWithField after IF');
            }
        }
        
       // System.debug('All the field '+sObjectTypes);
        return sObjectTypes;
    }
    
}