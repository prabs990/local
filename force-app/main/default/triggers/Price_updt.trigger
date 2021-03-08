trigger Price_updt on Book__c (before insert,before update) {

    If(Trigger.isInsert || Trigger.isUpdate)
    {
        Price_updt_class.price_updt(Trigger.new);
    }
}