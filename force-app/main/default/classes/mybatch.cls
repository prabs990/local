global class mybatch implements database.Batchable <sobject> {

    global database.QueryLocator start(database.BatchableContext bc)
    {
        string query = 'select id,name from account';
        return database.getQueryLocator(query);
    }
    global void execute(database.BatchableContext bc, list<account> act)
    {
        for (account a:act)
        {
            a.name = a.name + 'kaka';
        }
        update act;
    }
    public void finish(database.BatchableContext bc)
    {
        
    }
}