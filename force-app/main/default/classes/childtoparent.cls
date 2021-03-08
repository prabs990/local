public class childtoparent {
    public boolean flag1{set;get;}
    public boolean flag2{set;get;}
    public list<contact> conlist{set;get;}
    public void standardlookup()
    {
        flag1=true;
        flag2=false;
        conlist=[select lastname,firstname,account.name,account.industry from contact];
    }
    
    public void customlookup()
    {
        flag1=false;
        flag2=true;
        conlist=[select lastname,firstname ,customaccount__r.name,customaccount__r.industry from contact];
    }
}