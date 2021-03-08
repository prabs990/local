public with sharing class ListViewController {
    // Method to get all list view option available for the Account object 
    @AuraEnabled
    public static List<ListView> getListViews(){
        List<ListView> listviews = new List<ListView>();
        for(ListView lstObj : [SELECT Id, Name FROM ListView WHERE SobjectType = 'Account' order by name ASC]){
        	listviews.add(lstObj);
        }
        return listviews; 
    }
    // Method to get the Account records based on the selected list view
    @AuraEnabled  
    public static List<Account> getFilteredAccounts(String filterId){
        HttpRequest req = new HttpRequest();
        String baseUrl = URL.getSalesforceBaseUrl().toExternalForm();
        String endPoinURL = baseUrl+'/services/data/v32.0/sobjects/Account/listviews/'+filterId+'/describe';
        req.setEndpoint(endPoinURL);
        req.setMethod('GET');
        req.setHeader('Authorization',  'Bearer ' + UserInfo.getSessionId());
        Http http = new Http();
        HTTPResponse response = http.send(req);
        Map<String, Object> tokenResponse = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        String query = (String) tokenResponse.get('query');
        List<Account> AccountList = new List<Account>();
        for(Account accountObj : database.query(query)){
            AccountList.add(accountObj);
        }  
        return AccountList;        
    }
}