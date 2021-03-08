global class mybatchclass1 implements database.Batchable<sobject>{
    
    global database.QueryLocator start(database.BatchableContext bc)
    {
        string query= 'select id,name from account';
        return database.getQueryLocator(query);
    }
    global void execute(database.BatchableContext bc, list<account> act)
    {
        list<account> updt = new list<account>();
        for(account a:act)
        {
            a.name=a.name+'i';
            updt.add(a);
            
        }
        update updt;
    }
    global void finish(database.BatchableContext bc)
    {
        
    }

}