trigger updatetrigger on Account (before update) {

    for(account a:trigger.old)
    {
        system.debug('===trigger.old == account name :'+ a.name);
        system.debug('===trigger.old == account id :'+ a.id);
        system.debug('===trigger.old == account industry'+a.Industry);
    }
    for(account a:trigger.new)
    {
        system.debug('===trigger.new == account name:'+a.Name);
        system.debug('===trigger.new == account id:' +a.id);
        system.debug('===trigger.new == account industry' +a.Industry);
    }
    
    Map<id,account> oldmap = trigger.oldmap;
    Map<id,account> newmap= trigger.newmap;
    
    system.debug('===old map is =='+ oldmap);
    system.debug('===new map is =='+newmap);
}