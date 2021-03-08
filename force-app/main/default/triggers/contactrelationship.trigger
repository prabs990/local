trigger contactrelationship on Contact (after insert) {

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