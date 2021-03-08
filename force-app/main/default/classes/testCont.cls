public class testCont{
    
    public Account acc{get;set;}
    public Boolean initialised{get; set;}
    
    public testCont(){
        initialised = false;
    }
    public void init(){
        if(!initialised){
            acc = new Account ();
            acc.name='ABC';
            initialised = false;
        }
    }
}