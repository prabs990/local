trigger t1 on Merchandise__c (before insert,before update) {

for(merchandise__c m : trigger.new)
{
    if(trigger.isinsert && m.Merchandise_Price__c <500)
    {
        m.adderror('price < 500 not alwoed');
    }
    else if (trigger.isupdate && m.Merchandise_Price__c < 100)
    {
        m.adderror('price < 100 is not allowed');
    }
}
}