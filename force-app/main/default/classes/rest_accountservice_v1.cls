/*@Restresource(urlmapping='/v39.0/accounts/*')
global with sharing class rest_accountservice_v1{

    @httpget
    global static Account doget(){
        restrequest req = restcontext.request;
        restresponse res= restcontext.response;
        
        String accountid = req.requestURI.substring(req.requestURI.lastIndexof('/') + 1);
        Account result = [select id,name from account where name= :accountid];
        return result;
    }
}*/
@Restresource(urlmapping='/api/Account/*')
global with sharing class rest_accountservice_v1{
    @HttpGet
    global static Account getData(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        Id accId = req.requestURI.substring(req.requestURI.lastindexof('/')+1);
        Account acc = [select id,name,phone,website from Account where id = :accId ];
        return acc;
    }  
}