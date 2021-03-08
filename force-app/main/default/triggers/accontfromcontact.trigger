trigger accontfromcontact on Contact (before insert) {

    list<account> actlist = new list<account>();
    map<string,contact> mapcon= new map<string,contact>();
    for(contact c:trigger.new)
    {
        string accountname=c.FirstName+'demo account';
        account a = new account(name=accountname);
        actlist.add(a);
        mapcon.put(accountname, c);
    }
    insert actlist;
    
    for(account a:actlist)
    {
        if(mapcon.containsKey(a.name))
        {
            mapcon.get(a.Name).accountid=a.id;
        }
    }
     
}