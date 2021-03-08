trigger createupdateaccount on Account (before insert,before update) {

    List<Account> acc = new List<Account>();
    
    for(account a:[Select id,name from account where id in :trigger.new])
    {
        contact c = new contact(lastname=a.name + 'test', accountId=a.Id);
        insert c;
    }
}