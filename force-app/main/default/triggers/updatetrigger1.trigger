trigger updatetrigger1 on Account (before update) {

    list<account> oldacc=[select id,name,industry from account where id in :trigger.old];
    list<account> newacc=[select id,name,industry from account where id in :trigger.new];
    
    for(account a:oldacc)
    {
        system.debug('old acc account name' + a.name);
        system.debug('old account industry' + a.industry);
        a.Industry='education';
    }
    
    for(account a:newacc)
    {
        system.debug('new acc account name' + a.name);
        system.debug('new acc account industry' + a.industry);
        a.Industry='chemicals';
        
    }
}