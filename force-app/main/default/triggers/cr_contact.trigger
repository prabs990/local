trigger cr_contact on Contact (after insert, after update) {

    List<Contact_Relationship__c> crList = new List<Contact_Relationship__c>();
    for(Contact c:trigger.new)
    {
        if(c.Contact__c==true)
        {
            Contact_Relationship__c cr = new Contact_Relationship__c();
            cr.Name= c.LastName + 'new';
            cr.Contact__c= c.id;
            crList.add(cr);
        }
    }
    insert crList;
}