trigger Account_Updt on Account (before insert, before update) {

    if(Trigger.isInsert || Trigger.isUpdate)
    {
        
        AccountClass.InsertAccount(trigger.new);
    }
}