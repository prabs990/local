public class dynamicSoql{

    public static void dynamic_soql(){
        String SobjectApiName = 'Dynamicquery__c';
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName).getDescribe().fields.getMap();
 
        String commaSepratedFields = '';
        for(String fieldName : fieldMap.keyset()){
            if(fieldName.equals('id') || fieldName.equals('isdeleted') ||  
               fieldName.equals('setupownerid') || fieldName.equals('createddate') || fieldName.equals('createdbyid') ||
               fieldName.equals('lastmodifieddate') || fieldName.equals('lastmodifiedbyid') || fieldName.equals('systemmodstamp') 
              ){
                continue;
            }
            if(commaSepratedFields == null || commaSepratedFields == ''){
                commaSepratedFields = fieldName;
            }else{
                commaSepratedFields = commaSepratedFields + ', ' + fieldName;
            }
        }
 
        String query = 'select ' + commaSepratedFields + ' from ' + SobjectApiName + ' Limit 5';
        System.debug('query==='+query);
        //accList = Database.query(query);
// read fields from account dynamically as read from custom seeting and use getinstance as below
//            String color = Dynamicquery__c.getInstance(a.name);

    }
}