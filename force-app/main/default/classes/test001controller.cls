public class test001controller{

    public string keyString{set;get;}
    public string decryptedString {set;get;}
    public boolean show {set;get;}
    public string encodedCipherText{set;get;}
    public pagereference redirecturl(){
        EncryptionKey__c key1 = [select id,key__c from EncryptionKey__c limit 1];
        Blob key = Blob.valueOf(key1.key__c);
        keyString = key.toString();
        Blob data = Blob.valueOf('a076F00000iuxb4');

        Blob encrypted = Crypto.encryptWithManagedIV('AES128', key, data);
        encodedCipherText = EncodingUtil.base64Encode(Crypto.encryptWithManagedIV('AES128', key, data));

        show = true;
        Pagereference returl= new Pagereference('/apex/page8?id='+encodedCipherText);
        returl.setredirect(true);
        return returl ;
    }
}