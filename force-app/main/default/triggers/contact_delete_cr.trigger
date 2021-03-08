trigger contact_delete_cr on Contact (before delete) {
    
    Set<id> delid = new Set<id>();
    for(contact c:trigger.old)
    {
        delid.add(c.id);
    }
    List<Contact_Relationship__c> cr= [select id,name from Contact_Relationship__c where contact__C in :delid];
    delete cr;
}