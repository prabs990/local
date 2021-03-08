global class mybatchclass implements database.Batchable<sobject>,database.stateful{
    global integer count=0;
    global database.QueryLocator start(database.BatchableContext bc)
    {
        string query= 'select id,name from account';
        return database.getQueryLocator(query);
    }
    global void execute(database.BatchableContext bc, list<account> act)
    {
        for(account a:act)
        {
            a.name=a.name+'i';
            count++;
        }
        update act;
    }
    global void finish(database.BatchableContext bc)
    {
        system.debug('count is'+count);
    }

}