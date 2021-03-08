trigger contactrelationdelete on Contact (after insert, Before delete) {
   
    if(trigger.isinsert)
    {
        list<Contact_Relationship__c> conlist = new list<Contact_Relationship__c>();
        for(contact c:trigger.new)
        {
            if(c.Contact__c==true)
             {
                 Contact_Relationship__c conobject= new  Contact_Relationship__c();
                 conobject.name= c.FirstName;   
                 conobject.contact__c = c.id;   
                 conlist.add(conobject);    
             }
        }
        insert conlist;
    }
    if(trigger.isdelete)
    {
        Set<id> contactid = new Set<id>();
        for(contact c :trigger.old)
        {
            contactid.add(c.id);
            
        }
        system.debug('contact id that is being deleted is === '+ contactid);
//        map<id,Contact_Relationship__c> mapcr = new map<id,Contact_Relationship__c>([select id,name from Contact_Relationship__c where contact__C in :contactid]);
//        system.debug('map key is ======' + mapcr.keySet());
//        system.debug('map value is ======' + mapcr.values());
        list<Contact_Relationship__c> delcr = new list<Contact_Relationship__c>(); 
        for(Contact_Relationship__c c:[select id,name from Contact_Relationship__c where contact__c in :contactid])
        {
             delcr.add(c);
        }
        
        delete delcr;
 
    }
}