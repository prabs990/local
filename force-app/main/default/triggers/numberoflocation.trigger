trigger numberoflocation on Account (after insert) {

    map<id,list<contact>> mapcon = new  map<id,list<contact>>();
    list<contact> conlist = new list<contact>();
    if(trigger.isexecuting)
    {
        system.debug('jjj');
    }
    for(account a:trigger.new)
    {
         
  
        for(integer i=1;i<=a.numberofcontact__c;i++)
        {
 
            contact c = new contact();
            c.FirstName='checking';
            c.LastName='nashir' + a.Name + 'this is '+i+' record';
            c.AccountId=a.Id;
          
            conlist.add(c);
        }
        
   
//    insert mapcon;- error- you are inserting account id with contact object. Hence it would not know what to insert and where.
   
    }
     
    insert conlist;
}