trigger Opportunity_Salesteam on Opportunity (after insert) {

    List<OpportunityShare> oppShareList = new List<OpportunityShare>();
    List<OpportunityTeamMember> oppTeamList = new List<OpportunityTeamMember>();
    for(Opportunity opp : trigger.new)
    {
        OpportunityShare oppShare = new OpportunityShare();
        oppShare.OpportunityId=opp.id;
        oppShare.UserOrGroupId=opp.OwnerId;
        oppShare.OpportunityAccessLevel='Edit';
        oppShareList.add(oppShare);
        
        OpportunityTeamMember oppTeamMember = new OpportunityTeamMember();
        oppTeamMember.opportunityid= opp.id;
        oppTeamMember.UserId=opp.ownerid;
        oppTeamMember.TeamMemberRole='Account Manager';
        oppTeamList.add(oppTeamMember);
        
    }
    If(oppShareList!=null && oppShareList.size()>0)
    {
        insert oppShareList;
    }
    If(oppTeamList!=null && oppTeamList.size()>0)
    {
        insert oppTeamList;
    }
}