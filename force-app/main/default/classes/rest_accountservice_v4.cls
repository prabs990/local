@restresource(urlmapping='/v42.0/accounts/*')
global with sharing class rest_accountservice_v4
{
    @httppost
    global static accountwrapper dopost(String Name, String Phone, String Website)
    {
        Restrequest req= restcontext.request;
        restresponse res = restcontext.response;
        accountwrapper response = new accountwrapper();
        
        account acct = new account();
        acct.name=name;
        acct.phone=phone;
        acct.website=website;
        insert acct;
        
        response.acctlist.add(acct);
        response.status='success';
        response.message='record successfully inserted';
        return response;
    }
    
    global class accountwrapper
    {
    
    public list<account> acctlist;
    public string status;
    public string message;
    
    public accountwrapper()
    {
    acctlist = new list<account>();
    }
  }  
}