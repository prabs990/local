trigger hasattach1 on Attachment (before insert) {
    
	list<id> acc= new list<id>();
    for(attachment a :trigger.new)
    {
        System.debug(a.parentid);
        acc.add(a.ParentId);
    }
    List<account> acclist=[select id,has_attachment__c from account where id in :acc];
    if(acclist.size()>0 && acclist!=null)
    {
    	list<account> accupdalist = new list<account>();
    	for(account a:acclist)
    	{
        	a.has_attachment__c=true;
        	accupdalist.add(a);
    	}
		update accupdalist;
    }
}