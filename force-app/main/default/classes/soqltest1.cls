public class soqltest1 {
    public string accname{set;get;}
    public string accindustry{set;get;}
    public List<account> acts{set;get;}
    
    public void search()
    {
        acts=[select name,industry,billingaddress,Description from account where name=:accname and industry=:accindustry];
    }
    public void dynamicsearch()
    {
        String query='select name,industry,description from account';
        if((accname!=''&& accname!=null) && (accindustry!=null && accindustry!=''))
        {
            query=query+' where name=\''+accname+'\' and industry=\''+accindustry+'\'	';
        }
        else 
            if(accname!=null && accname!='')
        	{
            	query=query+' where name=\''+accname+'\'' ;
        	}
        	else
            {
                if(accindustry!=null && accindustry!='')
                {
                    query=query+ ' where industry=\''+accindustry+'\'';
                }
            }
        system.debug('query is '+query);
        acts=database.query(query);
    }
}