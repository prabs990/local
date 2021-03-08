trigger share_opportunity on Opportunity (after update) {

    id shareid=[select id from group where name='sharegroup1'].id;
    list<opportunityshare> opplist = new list<opportunityshare>();
    for(opportunity opp:trigger.new)
    {
        if(opp.LeadSource=='WEB' && opp.Amount > 10000)
        {
            opportunityshare oppshare = new opportunityshare();
            
            oppshare.UserOrGroupId=shareid;
            oppshare.OpportunityAccessLevel='read';
            oppshare.OpportunityId=opp.id;
            opplist.add(oppshare);
        }
    }
    insert opplist;
}