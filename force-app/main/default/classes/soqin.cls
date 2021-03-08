public class soqin {
	public list<contact> con;
 	public list<account> acc;
    public boolean flag1;
    public boolean flag2;
    
    public void listvariable()
    {
        list<string> ltr= new list<string>{'banking','energy'};
        acc=[select name,industry from account where industry in :ltr];
    }
    public void staticvariable()
    {
        acc=[select name,industry from account where industry in ('education')];
    }
    public void acclist()
    {
    	acc=[select id,name from account where industry='energy'];
    	con=[select firstname,lastname,account.industry from contact where account.id in :acc];
    }
    public void subquery()
    {
        con=[select lastname,firstname from contact where accountid in (select id from account where industry='banking')];
    }
}