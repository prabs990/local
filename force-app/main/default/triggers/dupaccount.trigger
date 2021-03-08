trigger dupaccount on Account (before insert) {
   
    map<string,account> accountmap = new map<string,account>(); 
    
    for(account a : [select id,name from account])
    {
        accountmap.put(a.Name, a);
    }
    for(account a:trigger.new)
    {
        if(accountmap.containsKey(a.name))
        {
            a.adderror('duplicate');
        }
    }
}