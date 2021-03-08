@Restresource(urlmapping='/v41.0/accounts/*')
global with sharing class rest_accountservice_v3
{

    @httpget
    global static Accountwrapper doget()
    {
        restrequest req = restcontext.request;
        restresponse res= restcontext.response;
    accountwrapper response = new accountwrapper();        

        String accountid = req.requestURI.substring(req.requestURI.lastIndexof('/') + 1);
     system.debug('before if');
    if(dosearch(accountid))
    {
        system.debug(' if 1');
        searchaccounts(req,res,response);
    }
    else
    {
        system.debug(' if 2');
        findaccounts(res, response, accountId);
    }
    
    return response;
    }

    private static boolean dosearch(String accountid)
    {
        if(accountid == 'accounts')
        {
         return true;
         
        }
    return false;
    }

    private static void searchaccounts(RestRequest req,Restresponse res,accountwrapper response)

    {
    String searchterm = req.params.get('Name');
    if(searchterm == null || searchterm=='')
    {
      response.status ='error';
      response.message='must give a name';
      res.statuscode = 400;
    }
    else
    {
      String searchtext = '%'+searchterm+'%';
      List<Account> searchresults = [select id,name from account where name like :searchtext];

      if (searchresults !=null && searchresults.size()>0)
        {
            response.acctlist = searchresults;
            response.status='success';
            response.message=searchresults.size() + 'accounts were found';
        }
      else

        {
            response.status='error';
            response.message='no accounts were found';
        }
    }   
    }

    private static void findaccounts(restresponse res,accountwrapper response,string accountid)

    {
    if(accountid!=null && accountid !=' ')
    {
    
           list<Account> result = [select id,name from account where name= :accountid];
    
       if(result!=null && result.size()>0)
       {
        response.acctlist.add(result[0]);
        response.status ='success';
       }
    
       else
       {
        
        response.status='error';
        response.message='this is not avaiavble';
        res.statuscode=404;
       }
        }
    else
    {
        response.status = 'error';
        response.message= ' you must specify an name to search';
        res.statuscode=400;
    }
    }
 
     global class accountwrapper 
    {

    public list<account> acctlist;
    public string status;
    public string message;
    
    public accountwrapper(){
        acctlist= new list<account>();}
    }
}