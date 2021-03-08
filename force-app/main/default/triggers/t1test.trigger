trigger t1test on Account (before update) {


    List<account> acclist = new List<account>();    
    for(account a :trigger.new){
        if(a.type=='Customer'){
            account a1 = new account(id=a.id);
            a.type='Prospect';
            acclist.add(a1);     
        }
        
   
    }

 //   update acclist;
}