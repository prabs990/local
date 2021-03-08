trigger Opportunity_Trigger on Opportunity (after insert , after update,after delete, after undelete, before insert) {  
    
    If(Trigger.isInsert && Trigger.isAfter)
    {
        Opportunity_Handler.Trigger_After_Insert(Trigger.new);
    }
    
    If(Trigger.isUpdate && Trigger.isAfter)
    {
        Opportunity_Handler.Trigger_After_Update(Trigger.old,Trigger.new);
    }
}