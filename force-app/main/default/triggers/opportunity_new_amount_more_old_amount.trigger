trigger opportunity_new_amount_more_old_amount on Opportunity (before update) {

    map<id,user> usermap=new map<id,user>([select id,name from user where firstname='prabhjit']);
    for(opportunity opp:trigger.new)
    {
        system.debug('opp id====' + opp.Id);
         
        opportunity oldopp=trigger.oldmap.get(opp.id);// why is opp.id not null , it is still not inserted in DB
        if(usermap.containsKey(opp.OwnerId))
        {
            if(oldopp.Amount>opp.Amount)
            {
                opp.adderror('since the record is owned by prabhjit, new account should be greater than the old amount');
            }
        }
    }
}