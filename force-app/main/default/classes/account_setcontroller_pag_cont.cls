public class account_setcontroller_pag_cont {

    public List<Account> accList{
        
        get
        {
            if(con!=null)
            {
                return (list<Account>)con.getRecords();
            }
            else
            {
                accList = new List<Account>();
                return accList;
            }
        }
        set;
    }
    public String accname{set;get;}
    public ApexPages.StandardSetController con{set;get;}
    public Boolean flag1{set;get;}
    public account_setcontroller_pag_cont()
    {
        accList= new List<account>();
            flag1=false;
//          con= new ApexPages.StandardSetController(Database.getQueryLocator([select id,name,industry from account where name like :accname]));
//*            con= new ApexPages.StandardSetController(Database.getQueryLocator([select id,name,industry from account where name='']));
    }

        
    public void search()
    {
        if(accName!='' && accName!=null)
        {
            flag1=true; 
            accname=accname+'%';
//            String query='select id,name,industry from account where name like :accname';
//            getlistaccount();
  			con= new ApexPages.StandardSetController(Database.getQueryLocator([select id,name,industry from account where name like :accname]));          
            con.setPageSize(2);
        }
    }
/*    public void getlistaccount()
    {
        con= new ApexPages.StandardSetController(Database.getQueryLocator([select id,name,industry from account where name like :accname]));
    }
*/
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
    public void first()
    {
        con.first();
    }
    public void last()
    {
        con.last();
    }
/*    public void refresh()
    {
        con=null;
        getlistaccount();
        con.setpagenumber(1);
    }
*/
}