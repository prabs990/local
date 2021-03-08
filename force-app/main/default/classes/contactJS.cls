global with sharing class contactJS{
    
    public contactJS(){
    }
    
    @RemoteAction
    global static List<contact> getcon(){
        return [select id,name from contact limit 5];
    }
}