public class examplecontroller{
    Datetime t1;
    transient Datetime t2;
    public string gett1(){
        if(t1==null)
            t1 = system.now();
        return '' + t1;
    }
    public string gett2(){
        if(t2==null)
        t2 = system.now();
        return ''+t2;
    }
    
}