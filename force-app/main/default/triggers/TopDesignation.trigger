trigger TopDesignation on Top_X_Designation__c (before update,after update) {
/*
    Set<Id> oppIdTrue = new Set<Id>();
    Set<Id> oppIdFalse = new Set<Id>();
    List<Opportunity> oppUpdt = new List<Opportunity>();
    for(Top_X_Designation__c c : trigger.new)
    {
        if(c.Type__c=='Contract Flow Down/Handoff' && c.Document_Attached__c==true)
        {
            oppIdTrue.add(c.Opportunity__C);
        }
        else 
        {
            oppIdFalse.add(c.Opportunity__c);
        }
    }
    if(oppIdTrue.size()>0)
    {
        Map<Id,Opportunity> mapList = new Map<Id,Opportunity>([SELECT id,name,HandOff_Attached__c FROM Opportunity WHERE id IN :oppIdTrue and HandOff_Attached__c!='yes']);
        for(Opportunity opp : mapList.values())
        {
            opp.HandOff_Attached__c='yes';
            oppUpdt.add(opp);
        }
    }
    if(oppIdFalse.size()>0)
    {
        Map<Id,Opportunity> mapList = new Map<Id,Opportunity>([SELECT id,name,HandOff_Attached__c FROM Opportunity WHERE id IN :oppIdFalse and HandOff_Attached__c!='no']);
        for(Opportunity opp : mapList.values())
        {
            opp.HandOff_Attached__c='no';
            oppUpdt.add(opp);
        }
    }
    update oppUpdt;
*/    
    for(Top_X_Designation__c top : trigger.new){
        if(Trigger.isBefore){
            System.debug('before 1==='+top.Type__c);
            top.Type__c = 'Extra';
            System.debug('before 2==='+top.Type__c);
        }else if(Trigger.isAfter){
            System.debug('old Trigger.oldmap.get(top.id).type__c==='+Trigger.oldmap.get(top.id).type__c);
            System.debug('new top.type__c==='+top.type__c);
            System.debug('old top.opportunity==='+top.Opportunity__c);
            System.debug('new top.opportunity==='+Trigger.oldmap.get(top.id).Opportunity__c);
                        
        }
    }
}