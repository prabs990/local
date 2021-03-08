trigger delete_account on Account (before delete) {

    Map<id,profile> sadmin = new Map<id,profile>([SELECT id,name FROM profile WHERE name='System Administrator']);
     
    for(Account a :trigger.old)
    {
        If(!(sadmin.containsKey(userinfo.getProfileId())))
        {
            a.adderror('you are not admin so cannot delete');
        }
    }
}