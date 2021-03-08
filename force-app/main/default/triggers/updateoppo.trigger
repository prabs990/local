trigger updateoppo on Opportunity (before update) {
    Map<ID,opportunity> oldmap=trigger.oldmap;
    for(opportunity o:trigger.new)
    {
        system.debug('o.CreatedBy.firstname===='+ o.CreatedBy.firstname);
        system.debug('o.lastmodifiedby.firstname.firstname===='+ o.lastmodifiedby.firstname);
        if(o.CreatedBy.firstname=='prabhjit')
        {
            o.adderror('cannot update this record');
        }
    }
}