public with sharing class MetadataUtil {

    public static void updateMetadata() {

        List<Test_Metadata_mdt> lstMetaData = [SELECT Id, Name from Test_Metadata_mdt Limit 500000];

        for (Test_Metadata_mdt tmd : lstMetaData){
            tmd.Name = 'Test'
        }

        update lstMetaData;
    }
}