trigger Opportunities_Trigger on Opportunity (before insert,after insert, before update, after update,before delete,after delete, after undelete)
{
  /*  If(Trigger.isInsert)
    {
        If(Trigger.isAfter)
        {
            Opportunities_handler.After_Insert_Trigger(Trigger.new);
        }
    }
    
    If(Trigger.isUpdate)
    {
        If(Trigger.isAfter)
        {
            Opportunities_handler.After_Update_Trigger(Trigger.old,Trigger.new);
        }
    }*/
    Map<Id,Decimal> accountIdTotalAmount = new Map<Id,Decimal>();
    
    for(AggregateResult agr : [SELECT accountId,SUM(amount__c)amt from Opportunity WHERE Id in :Trigger.new group by accountId ]){
            accountIdTotalAmount.put((Id)agr.get('accountId'),(Decimal)agr.get('amt'));
            
    }
    System.debug('accountIdTotalAmount==='+accountIdTotalAmount);
}