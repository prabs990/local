public class try1 {

    public void getlist()
    {
        List<String> lst= new List<String>();
        lst.add('ram');
        lst.add('shyam');
        lst.add('ram');
        system.debug('simple list elements ' + lst);
        for(String str:lst)
        {
            system.debug('for each printing '+str);
        }
        iterator<string> itr = lst.iterator();
        while(itr.hasNext())
        {
                 system.debug('iterator print ' + itr.next());
        }
    }
}