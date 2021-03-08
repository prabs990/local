public class employee_search_pagination_cont {

    public String education{set;get;}
    public Decimal yoe{set;get;}
    public String state{set;get;}
    public ApexPages.StandardSetController con;
    
    public List<Employee__c> empList
    {
        
      get
        {
            if(con!=null)
            {
                return (list<Employee__c>)con.getRecords();
            }
            else
            {
                empList= new List<Employee__c>();
                return emplist;
            }
        }
        set;
    }
    
    public employee_search_pagination_cont(apexpages.StandardController cont)
    {
//        empList= new List<Employee__c>();
//          con= new ApexPages.StandardSetController(Database.getQueryLocator([select id from Employee__C where name='']));
    }
    
    public employee_search_pagination_cont()
    {
        empList= new List<Employee__c>();
//        con= new ApexPages.StandardSetController(Database.getQueryLocator([select id from Employee__C where name='']));
    }
    public void search()
    {
		String query='SELECT name,Education__c,State_Province__c,Years_of_Experience__c FROM employee__c ';
        if(education!=null && education!='' && yoe!=0 && state!=null && state!='')
        {	system.debug('loop1========');
            query=query+' WHERE education__c=\''+education+'\' and State_Province__c=\''+state +'\' and Years_of_Experience__c='+yoe;
        }
        else if(education!=null && education!='' && yoe!=0 && (state==null || state=='') )
        {
            query=query+' WHERE education__c=\''+education+'\' and Years_of_Experience__c='+yoe;
        }
        else if(education!=null && education!='' && yoe==0 && (state==null || state==''))
        {
            query=query+' WHERE education__c=\''+education+'\'';
        }
        else if(education!=null && education!='' && yoe==0 && state!=null && state!='')
        {
            query=query+' WHERE education__c=\''+education+'\' and State_Province__c=\''+state +'\''; 
        }
        else if((education==null || education=='') && yoe!=0 && state!=null && state!='')
        {
            query=query+' WHERE State_Province__c=\''+state +'\' and Years_of_Experience__c='+yoe;
        }
        else if((education==null || education=='') && yoe!=0 && (state==null || state==''))
        {
            query=query+' WHERE Years_of_Experience__c='+yoe;
        }
        else if((education==null || education=='') && yoe==0 && (state!=null && state!=''))
        {
            query=query+' WHERE State_Province__c=\''+state +'\'';
        }
        query=query + ' order by name';
        system.debug('query======'+query);
        con=new ApexPages.StandardSetController(Database.getQueryLocator(query));
        con.setPageSize(2);
    }
    public Boolean hasNext
    {
        get
        {
            return con.getHasNext();
        }
        set;
    }
    public Boolean hasPrevious
    {
        get
        {
            return con.getHasPrevious();
        }
        set;
    }
    public void next()
    {
        con.next();
    }
    public void previous()
    {
        con.previous();
    }
}