trigger contactrelationowner1 on Contact_Relationship__c (before update) {

    map<id,contact_relationship__c> oldmap = new map<id,contact_relationship__c>();
    system.debug('line 4=======');
    for(contact_relationship__c c:trigger.old)
    {
        oldmap.put(c.ownerid, c);
    }
    system.debug('old map is ====' +oldmap);
    system.debug('line 8 ========');
    for(Contact_Relationship__c c1 : trigger.new)
    {
        system.debug('old map user id====='+oldmap.get(c1.Owner.Id));
        system.debug('new map user id====='+c1.OwnerId);
/*        if(oldmap.get(c1.OwnerId).id==c1.OwnerId)
        {
            system.debug('same user');
        }
*/
    }
    
}