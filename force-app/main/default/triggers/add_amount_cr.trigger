trigger add_amount_cr on Custom_Project__c (After insert) {

    Map<Id,Decimal> mapValue = new Map<Id,Decimal>();
    
    for(Custom_Project__c cr: Trigger.new)
    {
     	mapValue.put(cr.opportunity__c,cr.amount__c);   
    }
    
    for(Opportunity opp:[SELECT id,name,total_amount__c FROM Opportunity where id in :mapValue.keySet()])
    {
        opp.total_amount__c = opp.total_amount__c + mapValue.get(opp.Id);
        System.debug('opp.total_amount__c===='+ opp.total_amount__c);
        Update opp;
    }
}