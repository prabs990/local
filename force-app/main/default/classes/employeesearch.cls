public with sharing class employeesearch
{
    public list<employee__c> emplist{get;set;}
    public Employee__C filter{get;set;}
    public integer offset=0;
    public integer querylimit=10;
    public string query{get;set;}
    public string con,state,edu;
    double yoe;
    public integer counttotalrecords;
    public boolean re{set;get;}
    
    public employeesearch(apexpages.standardcontroller controller)
    {
        counttotalrecords=[select count() from employee__c];
        filter= new employee__c();
        re=false;
    }
    
    public void getemplist()
    {
        emplist=Database.query(query);
    }
    
     public void search()
    {
        yoe=filter.Years_of_Experience__c;
        state=filter.State_Province__c;
        edu=filter.education__c;
        
        query= 'select id,name,Years_of_Experience__c,State_Province__c,education__c from employee__c ';
        con='';
        
        if(yoe!=null && state!=null && edu!=null)
        con=' where Years_of_Experience__c=:yoe AND State_Province__c=:state AND education__c=:edu order by name limit :querylimit offset :offset';
        if(yoe!=null && state!=null && edu==null)
        con=' where Years_of_Experience__c=:yoe and State_Province__c=:state order by name limit :querylimit offset :offset';
        if(yoe!=null && state==null && edu==null)
        con=' where Years_of_Experience__c=:yoe order by name limit :querylimit offset :offset';
        if(yoe!=null && state==null && edu!=null)
        con=' where Years_of_Experience__c=:yoe and  education__c=:edu order by name limit :querylimit offset :offset';
        if(yoe==null && state!=null && edu==null)
        con=' where State_Province__c=:state order by name limit :querylimit offset :offset';
        if(yoe==null && state==null && edu!=null)
        con=' where education__c=:edu order by name limit :querylimit offset :offset';
        if(yoe==null && state!=null && edu!=null)
        con=' where State_Province__c=:state and education__c=:edu order by name limit :querylimit offset :offset';
        query+=con;
        getemplist();
        countTotalRecords=emplist.size();
        re=true;       
    }
    public void next()
    {
        offset+=querylimit;
        getemplist();
    }
    public void previous()
    {
        Offset -= QueryLimit;
        getemplist();
    }
    public boolean getdisablenext()
    {
      if(offset+querylimit<=counttotalrecords)
      {
      return false;
      }
      else
      {
      return true;
      }
    }
    public boolean getdisableprevious()
    {
      if(offset>0)
      {
      return false;
      }
      else
      {
      return true;
      }
    }
}