trigger addmr on Account (before insert) {

    list<account> act;  
    if(trigger.isbefore)
    {
        for(account a:trigger.new)
        {
            a.name='mr ' + a.name;
        }
        
    }
}