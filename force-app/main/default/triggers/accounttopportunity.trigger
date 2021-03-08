trigger accounttopportunity on Account (after insert) {

    list<opportunity> opplist = new list<opportunity>();
    for(account a:trigger.new)
    {
        opportunity opp=new opportunity();
        opp.name=a.name+' opportunity';
        opp.stagename='prospecting';
        opp.closedate=system.today()+10;
        opp.AccountId=a.id;
        opplist.add(opp);
    }
    insert opplist;
}