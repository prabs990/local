trigger contactrelationship12 on Contact_Relationship__c (before update) {

    map<id,user> mapuser = new map<id,user>([select id,name from user]);
    for(Contact_Relationship__c c :trigger.new)
    {
        Contact_Relationship__c oldcon = trigger.oldmap.get(c.Id);
        system.debug('oldcon.ownerid==== '+oldcon.ownerid);
        system.debug('c.OwnerId===='+c.Ownerid);
        if(!(oldcon.ownerid==c.OwnerId))
        {
            system.debug('same owner ids');
            if(mapuser.containsKey(c.OwnerId))
            {
                c.Name=c.Name+' '+ mapuser.get(c.OwnerId).name;
            }
        }
            
    }
}