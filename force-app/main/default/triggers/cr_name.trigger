trigger cr_name on Contact_Relationship__c (before update) {

    map<Id,user> mapuser= new map<id,user>([select id,name from user]);
    for(Contact_Relationship__c c:trigger.new)
    {
        Map<Id,Contact_Relationship__c> oldmap=trigger.oldmap;
        if(!(oldmap.containsKey(c.OwnerId)))
        {
            c.Name=mapuser.get(c.OwnerId).name;
        }
    }
}