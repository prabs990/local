trigger Customer_Accountteam_Update on Customer__c (before update) {
//Trigger Scenario 18 https://tekslate.com/15-sample-triggers-different-scenarios/

    for(Customer__c c : Trigger.new)
    {
        Map<Id,Customer__c> oldMap = trigger.oldMap;
        if(!(c.User__c == oldmap.get(c.Id).user__c))
        {
            
        }
    }
}