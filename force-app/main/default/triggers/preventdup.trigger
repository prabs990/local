trigger preventdup on Contact (before insert) {

    Map<string,contact> existingaccount = new map<string,contact>();
     
    for(contact c:[select id,firstname,lastname,phone from contact])//fires only 1(list contacts)
    {
        if(!existingaccount.containskey(c.lastname)){
            existingaccount.put(c.LastName, c);
        }   
    }
    for(contact c:trigger.new)
    {    
 
        if(existingaccount.containsKey(c.lastname))
        {
           c.adderror('contact name already exist Cant duplicate');
        }
    }
}