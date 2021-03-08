public class parenttochild {

    public list<account> acc{set;get;}
    public boolean flag1{set;get;}
    public boolean flag2{set;get;}
    public void standardlookupstandardfield()
    {
        flag1=true;
        flag2=false;
        acc=[select id,name,accountnumber,billingaddress,(select firstname,lastname from contacts) from account];
    }
    public void standardobjectcustomlookup()
    {
        flag2=true;
        flag1=false;
        acc=[select id,name,accountnumber,(select firstname,lastname from CustomContacts__r) from account];
    }
}