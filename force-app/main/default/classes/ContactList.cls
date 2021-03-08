public class ContactList {
	@AuraEnabled
    public static List<Contact> getContactList(){
        return [select id,name,phone,email from contact];
    }
}