trigger duplicate on Merchandise__c (before Insert, before update) {

    for(merchandise__c m:trigger.new)
    {
        List<merchandise__c> li = [select id from merchandise__C where name=:m.name];
        if(li.size()>0)
        {
        m.adderror('cannot create duplicate merchandise');
        }
    }
    
}