trigger no_of_contacts on Account (after insert) {

    List<Contact> conlist= new List<Contact>();
    for(Account a:trigger.new)
    {
        for(integer i=1;i<=a.numberofcontact__c;i++)
        {
            Contact c= New Contact(lastname='test user');
            c.AccountId=a.id;
            c.unique__c= 'user number' + i ;

            conlist.add(c);
        }
    }
    insert conlist;
}