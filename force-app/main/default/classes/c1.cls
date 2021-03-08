Public class c1
{
    List<account> acts =[select id,name,type from account];
    public list<account> geta()
    {
        System.debug('yes');
        return acts;
    }
}