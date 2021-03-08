public class MyContactListController {

    @AuraEnabled
    public static List<Contact> getContacts(Id recordId){
        return[select id,firstname,lastname,email,phone from contact where accountId=:recordId];
    }
}