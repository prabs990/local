public class displayContact {

@AuraEnabled
    public static List<Contact> getdisplayRecords(Id accountIdLocal){
        System.debug('accountId==='+accountIdLocal);
        List<Contact> conList = [select id,firstname,lastname from contact where accountId = :accountIdLocal];
        System.debug('conList=='+conList);
        return conList;
    }
}