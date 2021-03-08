public with sharing class areaofinterestcontroller {
    public areaofinterestcontroller() {

    }
    @AuraEnabled(cacheable = true)
    public static List<displayInterest> getDetails(){
        Map<String,String> areaOfInterest = new Map<String,String>();
        List<displayInterest> wrapper = new List<displayInterest>();
        Map<String,String> clinicalDivision = new Map<String,String>();
        List<String> contactAoi = new List<String>();
        Schema.DescribeFieldResult fieldResult = Contact.Area_of_interest__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry f : ple){
            System.debug('f.getLabel()==='+f.getLabel());
            System.debug('f.getValue()==='+f.getValue() );
            areaOfInterest.put(f.getLabel(), f.getValue());

        }
        for(Subscription__c sub : [SELECT id,Clinical_Division__c FROM Subscription__c WHERE Contact__c ='0036F00002HtjYmQAJ']){
            clinicalDivision.put(sub.Clinical_Division__c, sub.Clinical_Division__c);
        }
        for(Contact c : [Select id,Area_of_interest__c from contact where id='0036F00002HtjYmQAJ']){
            system.debug('c.Area_of_interest__c==='+c.Area_of_interest__c);
            contactAoi.addAll(c.Area_of_interest__c.split(';'));
        }
        for(String aoi : areaOfInterest.keySet()){
            //if(clinicalDivision.containsKey(aoi)){
            if(clinicalDivision.containsKey(areaOfInterest.get(aoi))){
                displayInterest d1 = new displayInterest(aoi,areaOfInterest.get(aoi),true,true);
                wrapper.add(d1);

            }else if(contactAoi.contains(areaOfInterest.get(aoi))){
                displayInterest d1 = new displayInterest(aoi,areaOfInterest.get(aoi),true,false);
                wrapper.add(d1);
            } else{
                displayInterest d1 = new displayInterest(aoi,areaOfInterest.get(aoi),false,false);
                wrapper.add(d1);
            }
        }
        return wrapper;
    }
    @AuraEnabled
    public static void saveAoi(List<String> checked,List<String> unchecked){
// can a person click on the checkbox and remove his intrest also or is this only to add interest?        
        System.debug('checked'+checked);
        System.debug('unchecked'+unchecked);
        Contact c = [SELECT id,Area_of_interest__c from contact where id='0036F00002HtjYmQAJ' LIMIT 1];
        System.debug('c.Area_of_interest__c before'+c.Area_of_interest__c);
        c.Area_of_interest__c = String.join(checked, ';');
        System.debug('c.Area_of_interest__c after assign'+c.Area_of_interest__c);
        
        update c;
        System.debug('c.Area_of_interest__c after update'+c.Area_of_interest__c);
    }
    public class displayInterest{
        @AuraEnabled
        public String aoi{set ;get;}
        @AuraEnabled
        public String aoiValue{set ;get;}
        @AuraEnabled
        public Boolean isChecked{set;get;}
        @AuraEnabled
        public Boolean disableCheckbox{set;get;}
        displayInterest(String aoi_local,String aoiValue_local, Boolean isChecked_local,Boolean disableCheckbox_local){
            aoi = aoi_local;
            aoiValue = aoiValue_local;
            isChecked = isChecked_local;
            disableCheckbox = disableCheckbox_local;

        }
    }
}