trigger prac1 on Account (before insert) {

    Map<String,account> mapAcc = new Map<String,account>();
    
    for(account a:[SELECT id,name FROM account])
    {
        mapAcc.put(a.name, a);
    }
    
    for(Account a : trigger.new)
    {
        if(mapAcc.containsKey(a.Name))
        {
            a.adderror('duplocates not allowed');
        }
    }
}