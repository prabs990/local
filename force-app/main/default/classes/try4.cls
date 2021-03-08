public class try4 {

    public void getmap()
    {
        Map<Integer,List<String>> m = new map<integer,list<string>>();
        List<string> ltr1 = new list<string>();
        ltr1.add('ram1');
        ltr1.add('shyam1');
        List<string> ltr2 = new list<string>();
        ltr2.add('ram2');
        ltr2.add('shyam2');
        m.put(1, ltr1);
        m.put(2, ltr2);
        system.debug('map 1' +m.get(1));
        system.debug('map 2' +m.get(2));
        system.debug('total map' + m);
        
    }
}