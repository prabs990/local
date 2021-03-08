trigger prevent_dup_account on Account (before insert) {

    map<String,Account> mapacc = new map<String,Account>();
    
    for(account a:[select id,name from account])
    {
        mapacc.put(a.name, a);
    }
    for(account a: trigger.new)
    {
        if(mapacc.containsKey(a.Name))
        {
            a.adderror('duplicate account');
        }
    }
}