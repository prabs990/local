trigger PlatformEventDemo on Cloud_News__e (after insert) {

    List<Case> caseList = new List<Case>();
    user us = [select id from user where name like 'prabhjit%' limit 1];
    
    for(Cloud_News__e cn : Trigger.new)
    {
        if(cn.Urgent__c==true)
        {
            system.debug('Inside if ===' +cn.Urgent__c);
            system.debug('user id is ===' +us.id);
            case cs = new case();
            cs.Priority = 'high';
            cs.Subject='Dispatch news team to  ' + cn.Location__c;
            cs.OwnerId = us.Id;
            insert cs;
            caseList.add(cs);
            system.debug('last line if ===' +cn);
        }
    }
    system.debug('Before insert');
    insert caseList;
}