trigger salesrep_account on Account (before insert) {

    Map<id,User> mapuser= new Map<Id,User>([SELECT id,name from User]);

    for(Account a:trigger.new)
    {
        if(mapuser.containsKey(a.OwnerId))
        {
            a.salesrep__c=mapuser.get(a.OwnerId).name;
        }
    }
}