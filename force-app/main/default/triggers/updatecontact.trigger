trigger updatecontact on Account (before insert) {
    list<account> newacc=trigger.new;
    list<account> accs=[select id,(select phone,accountid from contacts) from account where id in :newacc];
    list<contact> cons= new list<contact>();
    for(account a:accs)
    {
        for(contact c:a.contacts)
        {
            c.phone='9999';
            cons.add(c);
        }
    }
    update cons;
}