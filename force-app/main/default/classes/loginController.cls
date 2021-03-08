public class loginController{
    public String timer{set;get;}
    public credential__c detail{set;get;}
    public String username{set;get;}
    public String password{set;get;}
     
    public loginController(){
        detail = new credential__c();
    } 
    public pagereference login(){
        List<credential__c> crd = [select id,username__c,password__c from credential__c where username__c=:detail.username__c and password__c=:detail.password__c limit 1];
        if(crd.size()>0){
           System.debug('detail.timer__c==='+detail.timer__c); 
           PageReference retURL = new PageReference('/apex/QuestionPage?timer='+detail.timer__c);
           retURL.setRedirect(true);
           return returl;
        }
        return null;
    }    
    
}