trigger prefixdrtolead on Lead (before insert,before update) {
 
         for(lead l : trigger.new)
         {
             if(!(l.FirstName.startswith('Dr.')))
                {
                    l.firstname='Dr.' + l.FirstName;
                }
         }     
}