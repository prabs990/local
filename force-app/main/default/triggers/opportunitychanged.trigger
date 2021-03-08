trigger opportunitychanged on Opportunity (before update) {

    for(opportunity opp:trigger.new)
    {
        opportunity oldopp= trigger.oldmap.get(opp.id);
        if(oldopp.StageName==opp.StageName)
        {
            system.debug('same stage wont fire');
        }
        else
        {
            system.debug('different stages');
        }
        
    }
}