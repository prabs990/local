public with sharing class projectListController {
    public projectListController() {

    }
    @AuraEnabled(cacheable = true)
    public static List<SObject> getProjects(){
        String serviceTitan = 'Service Titan';
        String fonteva = 'Fonteva';
        String oracle = 'Oracle';
        
        String query = 'SELECT Id,Name,Manager__c FROM Custom_Project__c WHERE name IN (:fonteva,:serviceTitan,:oracle)';
        System.debug('query is==='+query);
        return Database.query(query);
    }
}