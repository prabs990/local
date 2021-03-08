trigger contactrelationshipowner on Contact_Relationship__c (before update) {

    map<id,Contact_Relationship__c> oldcontact = new map<id,Contact_Relationship__c>([select id,owner.name from Contact_Relationship__c where id in : trigger.old]); 
    map<id,Contact_Relationship__c> mapcon = new map<id,Contact_Relationship__c>();
    for(Contact_Relationship__c c : trigger.new)
    {
         if(oldcontact.containsKey(c.id))
         {
             system.debug('old id======'+oldcontact.get(c.id).owner.id);
             system.debug('new id====' + c.ownerid);
             // difference between c.owner.id and c.ownerid
             if(oldcontact.get(c.id).owner.name!=c.owner.name)
             {
                 system.debug('====change in owner====');
                 mapcon.put(c.ownerid,c);
                  
             }
         }
    }
    for(Contact_Relationship__c c :trigger.new)
    {
        
    }
     
}