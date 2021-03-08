public class c4{

     list<opportunity> opp ;
     public list<opportunity> getopp()
     {
          return opp;
     }
     
     public void channel(){
     
     opp= [select name from opportunity where stagename='Closed Won'];

     }
     public void direct(){
     
     opp= [select name from opportunity where stagename<>'Closed Won'];

     }

}