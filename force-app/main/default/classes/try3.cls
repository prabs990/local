public class try3 {

    public void getmap()
    {
        Map<integer,String> m = new Map<integer,String>();
        m.put(1,'ram');
        m.put(2, 'shyam');
        m.put(3, 'ram');
        
        System.debug('simple map print '+m);
        system.debug('map 0 ' +m.get(0));
        system.debug('map 1 '+ m.get(1));
        
        system.debug('keyset '+ m.keySet());
        system.debug('value '+ m.values());
        system.debug('size ' + m.size());
        m.clear();
        system.debug('map is' + m);
        system.debug('check boolean '+ m.isEmpty());
        m.put(1,'ram');
        m.put(2, 'shyam');
        Map<Integer,String> m1 = new Map<Integer,String>();
        m1=m.clone();
        System.debug('map is '+m1);
    }
}