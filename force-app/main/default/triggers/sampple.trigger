trigger sampple on Contact (before delete) {
    
    Map<id,String> accEmail = new Map<id,String>();
    
    for(contact c:trigger.old){
        accEmail.put(c.accountId,c.email);
//        system.debug('inside c===');
    }
    
    for(account a :[select id,name,cemail__c from account where id in :accEmail.keySet()]){
        a.cEmail__c= a.cEmail__c.replaceAll(accEmail.get(a.Id),'');
        System.debug('a.cEmail__c ==='+a.cEmail__c);
        update a;
    }

}