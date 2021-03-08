@Restresource(urlmapping='/v40.0/accounts/*')
global with sharing class rest_accountservice_v2{

    @httpget
    global static Accountwrapper doget(){
        restrequest req = restcontext.request;
        restresponse res= restcontext.response;
    accountwrapper response = new accountwrapper();        

        String accountid = req.requestURI.substring(req.requestURI.lastIndexof('/') + 1);
        list<Account> result = [select id,name from account where name= :accountid];
    if(result!=null && result.size()>0){
    response.acct= result[0];
    response.status ='success';
    }
    
    else{
    response.acct=null;
    response.status='error';
    response.message='this is not avaiavble';
    res.statuscode=404;
    }

    return response;
     }
 
     global class accountwrapper {

    public account acct;
    public string status;
    public string message;
    
    public accountwrapper(){}
}
}