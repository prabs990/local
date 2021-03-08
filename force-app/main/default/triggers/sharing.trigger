trigger sharing on Account (after insert) {

    id groupid =[select id from user where alias='ccapo'].id;
    for(account a:trigger.new)
    {
         accountshare ac = new accountshare();
         ac.accountaccesslevel='read';
         ac.accountId=a.Id;// ac.id=a.id
         ac.UserOrGroupId=groupid;
         ac.OpportunityAccessLevel='read';
         system.debug('before a.id======='+a.id); 
         system.debug('before   ac.accountid==='+ac.accountid);
        system.debug(' before ac.id====='+ac.Id);
         insert ac;
        system.debug('a.id======='+a.id);
        system.debug('ac.accountid==='+ac.accountid);
        system.debug('ac.id====='+ac.Id);
    }
}