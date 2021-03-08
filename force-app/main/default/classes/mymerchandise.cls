public class mymerchandise{

merchandise__c mer;
   public string   decryptedString{set;get;}
   public mymerchandise(){
     String i =apexpages.currentpage().getparameters().get('id');

// new code
     EncryptionKey__c key1 = [select id,key__c from EncryptionKey__c limit 1];
     Blob key = Blob.valueOf(key1.key__c);
     Blob blobData = EncodingUtil.base64Decode(i);
     Blob decryptedBlob = Crypto.decryptWithManagedIV('AES128', key, blobData);   
     decryptedString = decryptedblob.ToString(); 
//new code     
     if(decryptedString ==null)
     mer=new merchandise__c();
     else
     mer=[select id,name from merchandise__c where id=:decryptedString ];
    }
    
    public merchandise__c getmer1(){
     
     return mer;
    }

    public void doinsert(){
    upsert mer;
    }
}