global class batchcount implements database.Batchable<sobject>,database.stateful {

    global integer i=0;
    
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        String query = 'select id,name from account';
        
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext bc, List<Account> accList)
    {
          for(Account a : accList)
            {
         		i=i+1;
            }
        System.debug('i is===='+i);
		//10
		//10
		//10
		//10
		//9
    }
    global void finish(Database.BatchableContext bc)
    {
        system.debug('count is ==='+i);
        //0
    }
}