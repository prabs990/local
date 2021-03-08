trigger Undelete_Contact on Contact (after undelete) {

    Map<Id,contact> mapcon = new map<Id,contact>([select id,name,(select id,name from Contact_Relationships__r) from contact where id in :Trigger.new all rows]);
    List<Contact_Relationship__c> crList = new List<Contact_Relationship__c>();
    for(Contact c : mapcon.values())
    {
        
        for(Contact_Relationship__c cr : c.Contact_Relationships__r)
        {
            crList.add(cr);
        }
    }
    undelete crList;
}