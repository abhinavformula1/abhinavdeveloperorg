public with sharing class DateTypeSizeUtil {
    
    public static Integer getSizeInByte(Integer myInteger){

        Integer byteSize = EncodingUtil.base64Encode(Blob.valueOf(String.valueOf(myInteger))).length();
        System.debug('Byte size of integer: ' + byteSize);
        return byteSize;
    }
}