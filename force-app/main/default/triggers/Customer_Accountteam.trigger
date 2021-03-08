trigger Customer_Accountteam on Customer__c (after insert) {
// Scenario 17.. https://tekslate.com/15-sample-triggers-different-scenarios/

    List<AccountShare> accShareList = new List<AccountShare>();
    List<AccountTeamMember> accTeamList = new List<AccountTeamMember>();
    
    for(Customer__c c : Trigger.new)
    {
        if(c.User__c!=null)
        {
        	AccountShare accShare = new AccountShare();
        	AccShare.AccountAccessLevel = 'Edit';
        	AccShare.AccountId = c.Account__c;
        	AccShare.UserOrGroupId = c.User__c;
            AccShare.OpportunityAccessLevel = 'Read';
    		accShareList.add(accShare);        
        
        	AccountTeamMember accTeamMember = new AccountTeamMember();
        	accTeamMember.AccountAccessLevel = 'Edit';
        	accTeamMember.AccountId = c.Account__c;
        	accTeamMember.UserId = c.User__c;
            accTeamMember.TeamMemberRole='Account Manager';
            accTeamList.add(accTeamMember);
        }
    }
    
    insert accShareList;
    insert accTeamList;
}