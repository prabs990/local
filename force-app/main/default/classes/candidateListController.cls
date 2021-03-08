public with sharing class candidateListController {
    public candidateListController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Candidate__c> getCandidateRecords(String project,String sortorder, String client){
        String query;
        if(sortorder =='' || sortorder==null){
            sortorder = 'ASC';
        }
        if(client==null || client==''){
            query = 'select Id,First_Name__c,selfpic__c,Experience__c,Escalations__c,Upcoming_Holiday__c,Current_Allocation__c,Pending_Cases__c,Bandwidth__c FROM Candidate__c WHERE custom_project__r.name = :project Order By Bandwidth__c ' + sortorder;
        }
        if(client!=null){
            query = 'select Id,First_Name__c,selfpic__c,Experience__c,Escalations__c,Upcoming_Holiday__c,Current_Allocation__c,Pending_Cases__c,Bandwidth__c FROM Candidate__c WHERE Client__c =:client  Order By Bandwidth__c ' + sortorder;
        }
        
        return Database.query(query);
    }
    
}