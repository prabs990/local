trigger trigger1 on Merchandise__c (before insert,before update) {

for(Merchandise__c m : trigger.new)
{
    if (trigger.isinsert && m.Merchandise_Price__c < 500)
    {
          m.adderror('record cannot be inserted , price <500');
      
     }
     else
     {
       if(trigger.isupdate && m.Merchandise_Price__c<100)
       {
        
        m.adderror('record cannot be updated , price <100');
       }
     }        
    }
                                                                 }