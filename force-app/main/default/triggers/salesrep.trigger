trigger salesrep on Account (before insert,before update) {

    map<id,user> mapuser = new map<id,user>([select id,name from user]);

    for(account a:trigger.new)
    {
        if(mapuser.containsKey(a.OwnerId))
        {
            a.salesrep__c=mapuser.get(a.OwnerId).name;
        }
    }

}