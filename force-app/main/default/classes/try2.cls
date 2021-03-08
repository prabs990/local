public class try2 {

    public void getset()
    {
        Set<String> str= new Set<String>();
        str.add('ram');
        str.add('shyam');
        str.add('ram');
        System.debug('set print' + str);
        
        for(String s:str)
        {
            system.debug('for each print '+ s);
        }
        
        Iterator<string> itr=str.iterator();
        while(itr.hasNext())
        {
            system.debug('iterator print '+ itr.next());
        }
    }
}