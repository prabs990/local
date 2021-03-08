public without sharing class ContactController {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getRelatedContacts(Id accountId){
        return [select id,name,phone,email from contact where accountId =:accountId limit 5];
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getRelatedFilterContact(Id accountId,String key){
        System.debug(accountId +'=== '+ key);
        String queryString  = 'select id,name,phone,email from Contact where accountId =:accountId and Name like \'%'+key+ '%\' limit 5';
        System.debug(queryString);
        return Database.query(queryString);
    }
}