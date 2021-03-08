public class parentchild {

    public map<id,string> maplist = new map<id,string>();
    public void pc()
    {
        list<contact> conlist = [select id,name,email,account.id,account.email__c from contact where name like 'a%'];
        for (contact c: conlist)
        {
            if(c.email!='')
            {
                maplist.put(c.id,c.email);
            }
            else
            {
                maplist.put(c.id,c.account.email__c);
            }
        }
        system.debug('map is'+ maplist);
    }
}