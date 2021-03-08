public with sharing class customLookupController {
    public customLookupController() {

    }
    @AuraEnabled
    public static List<SObject> findRecords(String searchKey, String objectName, String searchField){
        System.debug('searchKey '+searchKey + 'objectName '+objectName + 'searchField '+searchField);
        String key = '%' + searchKey + '%';
        String QUERY = 'Select Id, '+searchField+' From '+objectName +' Where '+searchField +' LIKE :key';
        System.debug(System.LoggingLevel.DEBUG, QUERY);
        List<SObject> sObjectList = Database.query(QUERY);
        system.debug('sObjectList==='+sObjectList);
        return sObjectList;
    }
    
}