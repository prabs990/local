trigger add_amount_custom on Custom_Project__c (after insert) {

    Set<Id> cpIdList = new Set<Id>();
    for(Custom_Project__c c : trigger.new)
    {
        cpIdList.add(c.opportunity__c);
    }
    List<Opportunity> oppList = [SELECT id,name,(SELECT id,amount__C from Custom_Projects__r) from Opportunity WHERE id in :cpIdList];
    List<Opportunity> oppUpdt = new List<Opportunity>();
    for(Opportunity opp : oppList)
    {
        Decimal tAmount=0;
        List<Custom_Project__c> clist=[select id,name,amount__c from Custom_Project__c where opportunity__c=:opp.id];
        for(Custom_Project__c cr : cList)
        {
            tAmount=tAmount+cr.amount__c;
        }
        opp.total_amount__c=tAmount;
        oppUpdt.add(opp);
    }
    update oppUpdt;
}