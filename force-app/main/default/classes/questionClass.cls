public class questionClass{
    
    public List<questions__c> questionDisplay{set;get;}
    public Boolean blockOne{set;get;}
    public Boolean blockTwo{set;get;}
    public Boolean blockThree{set;get;}
    public Boolean start;
    public String timerValue{set;get;}
    
    public questionCLass(){

        timerValue = apexpages.currentpage().getparameters().get('timer');
        blockOne=true;
        questionDisplay = [select id,column1__c,column2__c,column3__c from questions__c where block1__c=true];
    }
    
    public pagereference questionChange(){
                
       if(blockOne==true){
           blockOne=false;
           blockTwo=true;
           blockThree=false;                      
           questionDisplay = [select id,column1__c,column2__c,column3__c from questions__c where block2__c=true];
           return null;   
       } 
       if(blockTwo==true){
           blockOne=false;
           blockTwo=false;
           blockThree=true;                      
           questionDisplay = [select id,column1__c,column2__c,column3__c from questions__c where block3__c=true];   
           return null;
       }
       if(blockThree==true){
           blockOne=false;
           blockTwo=false;
           blockThree=false;      
           System.debug('inside redirect page===')  ;              
           PageReference retURL = new PageReference('/apex/answerpage');
           retURL.setRedirect(true);
           return returl;
       }
       return null;
       
    }
}