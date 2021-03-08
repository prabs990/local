public class wrapperExample{
    
    public list<account> selectedAccount {set;get;}
    public list<account> acc = new list<account>();
    public list<wrapperClass> wrapper {set;get;}
    public integer counter = 0;
    public wrapperExample(){
        selectedAccount = new List<account>();
        wrapper = new list<wrapperClass>();
        acc = [select id,name,type from account where type!=null limit 10];
        
        initializeWrapper();
    }
    
    public void initializeWrapper(){
        
        for(account a :acc){
            counter++;
            wrapperClass wc = new wrapperClass(a,counter);
            wrapper.add(wc);
        }
    }
    
    public void selectedRecords(){
    
    }
    
    public class wrapperClass{
        public boolean selected{set;get;}
        public integer count{set;get;}
        public account acc{set;get;}
        
        wrapperclass(account a,integer c){
            acc = a;
            count = c;
            selected = false;
        }
    }
}