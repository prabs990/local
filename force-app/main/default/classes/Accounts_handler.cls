@Restresource (urlmapping='/account_functionality/*')

global class Accounts_handler {
	
@HttpGet

    global static Account doGet()
    {
        RestRequest req = Restcontext.request;
        RestResponse res = Restcontext.response;
        
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account actList = [SELECT id,name,AccountNumber,phone FROM Account WHERE id = :accountId];
        return actList;
    }    

@HttpPost    
    
    global static String doPost(String accName, String phoneNumber, String accountNumber)
    {
        Account acc = new Account();
        acc.Name=accName;
        acc.Phone=phoneNumber;
        acc.AccountNumber=accountNumber;
        insert acc;
        
        return acc.Id;
    }

@HttpDelete

	global static String doDelete()
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String accountId = req.requestURI.substring(req.requestURI.lastindexof('/')+1);
        Account actDel = [SELECT id FROM Account WHERE id = : accountId];
        delete actDel;
        return 'successful';
    }
}