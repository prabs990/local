public class account_offset_pagination_controller {

    public List<Account> accList{set;get;}
    public List<Account> accList1{set;get;}
    public String accName{get;set;}
    public Integer pagelimit=2;
    public Integer pageOffset=0;
    public Integer totalRecords=0;
    public Boolean flag1{set;get;}
    public account_offset_pagination_controller(Apexpages.StandardController cont)
    {
        flag1=false;
         
    }
    
    public PageReference displayAccounts()
    {	flag1=true; 
     	system.debug('accname===='+accname);
        accname=accname+'%';
        accList1=[SELECT id,name FROM Account WHERE name like :accName];
     	totalRecords=acclist1.size();
        getRecords();
 //    	getdisableNext();
        return null;
    }
    public void getRecords()
    {
        accList=[SELECT id,name FROM Account WHERE name like :accName LIMIT :pageLimit OFFSET :pageOffset];
    }
    public PageReference next()
    {
    
        pageoffset=pageoffset+pagelimit;
        getRecords();
        return null;
    }
    public PageReference previous()
    {	
        pageoffset=pageoffset-pagelimit;
        getrecords();
        return null;
    }
    public Boolean getdisableNext()
    {
         system.debug('disable para pageoffset====='+pageOffset);
        system.debug('disable para pageoffset====='+pageLimit);
        system.debug('disable para pageoffset====='+totalRecords);
        
         if(pageOffset+pageLimit<=totalRecords)
            return false;
        else
            return true;
  
    }
    public Boolean getdisablePrevious()
    {
        if(pageoffset>0)
        return false;
        else
            return true;
    }
}