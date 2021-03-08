public with sharing class productselectioncontroller {
    public productselectioncontroller() {

    }
    @AuraEnabled
    public static List<requiredProductWrapper> getRequiredProductList(){
        List<requiredProductWrapper> requiredProduct = new List<requiredProductWrapper>();
        List<Product2> reqProduct = [SELECT Id,Name,discount__c,quantity__c,Family FROM Product2 WHERE isRequired__c = true];
         for(Product2 product : reqProduct){
            requiredProductWrapper req = new requiredProductWrapper(product.Name,product.Id,product.Family,true,true);
            requiredProduct.add(req);
         }
         return requiredProduct;
    }
    public class requiredProductWrapper{
        @AuraEnabled
        public String productname{set;get;}
        @AuraEnabled
        public String productid{set;get;}
        @AuraEnabled
        public String family{set;get;}
        @AuraEnabled
        public Boolean ischecked{set;get;}
        @AuraEnabled
        public Boolean isdisabled{set;get;}
        requiredProductWrapper(String productname, String productid, String family , Boolean ischecked , Boolean isdisabled){
            this.productname = productname;
            this.productid = productid;
            this.family = family;
            this.ischecked = ischecked;
            this.isdisabled = isdisabled;
        }
    }

    @AuraEnabled
    public static List<requiredProductWrapper> getOptionProductList(){
        List<requiredProductWrapper> optionalProduct = new List<requiredProductWrapper>();
        List<Product2> optProduct = [SELECT Id,Name,discount__c,quantity__c,Family FROM Product2 WHERE isOptional__c = true];
         for(Product2 product : optProduct){
            requiredProductWrapper req = new requiredProductWrapper(product.Name,product.Id,product.Family,true,false);
            optionalProduct.add(req);
         }
         return optionalProduct;

    }

    @AuraEnabled
    public static string saveProduct(List<Id> mandatoryProductId){
        List<OpportunityLineItem> oppLineItem = new List<OpportunityLineItem>();
        List<Product2> mandatoryProducts = [SELECT Id,Name FROM Product2 WHERE Id in :mandatoryProductId];
        for(Product2 product : mandatoryProducts){
            OpportunityLineItem oli = new OpportunityLineItem();
            oli.Product2Id = product.Id;
            oli.Quantity = 3;
            //oli.ProductCode = product.ProductCode;
            oli.OpportunityId = '0066F00000ny6xPQAQ';
            System.debug('oli.Quantity==='+oli.Quantity + ' ' + 'oli.UnitPrice==='+oli.UnitPrice);
            oli.TotalPrice = oli.Quantity * 1000;
            oppLineItem.add(oli);
        }
        try{
            
            insert oppLineItem;
            System.debug('oppLineItem==='+oppLineItem);
            return 'Successful';
        }
        catch(Exception e){
            System.debug('error is==='+e);
            return e.getMessage();
        }
        
    }
    @AuraEnabled
    public static void saveProduct1(List<OpportunityLineItem> products){
        System.debug('products==='+products);
        //insert products;
    }
    @AuraEnabled(cacheable = true)
    public static List < FatchValueWrapper > fatchPickListValue(sObject objInfo, string picklistFieldApi) {
        // Describe the SObject using its object type.
        Schema.DescribeSObjectResult objDescribe = objInfo.getSObjectType().getDescribe();
 
        // Get a map of fields for the SObject
        map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
 
        // Get the list of picklist values for this field.
        list < Schema.PicklistEntry > values = fieldMap.get(picklistFieldApi).getDescribe().getPickListValues();
 
        // Create a list of wrapper to store picklist value/lable
        list < FatchValueWrapper > objWrapper = new list < FatchValueWrapper > ();
 
        for (Schema.PicklistEntry a: values) {
            FatchValueWrapper oFatchValueWrapper = new FatchValueWrapper();
            oFatchValueWrapper.slabel = a.getLabel();
            oFatchValueWrapper.svalue = a.getValue();
            objWrapper.add(oFatchValueWrapper);
        }
        return objWrapper;
 
    }
 // wrapper class 
    public with sharing class FatchValueWrapper {
        @auraEnabled public string slabel {get;set;}
        @auraEnabled public string svalue {get;set;}
    }
}