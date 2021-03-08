public with sharing class accountListLWC {
    public accountListLWC() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(String srchkey){
        String key = '%'+srchkey + '%';
        String Query = 'select id,name,email__c,industry from Account where name like :key';
        return Database.Query(Query);
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(String srchContact){
        String key = '%'+srchContact + '%';
        String Query = 'select id,name,email from Contact where name like :key';
        return Database.Query(Query);
    }
}