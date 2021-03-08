trigger Count_of_Contact_On_Account on Contact (after insert, after delete) {

    if(Trigger.isInsert)
    {
	    Set<Id> accountIdList = new Set<Id>();
		
        for(Contact c: trigger.new)
    	{
        	accountIdList.add(c.AccountId);
        }
        
    	Map<Id,Account> mapAcc = new Map<Id,Account>([SELECT id,name,(SELECT id,name from Contacts) FROM Account WHERE id in :accountIdList]);
		List<Account> accUpdt = new List<Account>();
    	
        for(Account a : mapAcc.values())
    	{
       		Integer i = a.Contacts.size();
       	 	mapAcc.get(a.Id).numberofcontact__c=i;
       	 	accUpdt.add(a);
    	}
        
    	update accUpdt;
    }
    if(Trigger.isDelete)
    {
        Set<Id> accountIdList = new Set<Id>();
		
        for(Contact c: trigger.old)
    	{
        	accountIdList.add(c.AccountId);
        }
        	system.debug('accountIdList====='+accountIdList);
    		Map<Id,Account> mapAcc = new Map<Id,Account>([SELECT id,name,(SELECT id,name from Contacts) FROM Account WHERE id in :accountIdList]);
			List<Account> accUpdt = new List<Account>();
    	
        	for(Account a : mapAcc.values())
    		{
       			Integer i = a.Contacts.size();
       	 		mapAcc.get(a.Id).numberofcontact__c=i;
       	 		accUpdt.add(a);
    		}
        update accUpdt;
    }
    
}