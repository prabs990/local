trigger count1 on Invoice__c (Before Update) {

For(Invoice__c i:trigger.old)
{
      Invoice__c r = [select Count_LI__c from Invoice__c where id=:i.id];

        

       Decimal d = r.count_LI__c;
      if(d ==2)
      {
      i.adderror('cant create more than 2 line items');
      }

}

}