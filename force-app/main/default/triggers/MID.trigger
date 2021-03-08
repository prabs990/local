trigger MID on Line_Item__c (Before Insert, Before Update) {

if((Trigger.IsInsert && Trigger.IsBefore) || (Trigger.IsUpdate && Trigger.Isbefore))
{

}

}