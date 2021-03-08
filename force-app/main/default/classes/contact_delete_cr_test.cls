@istest
public class contact_delete_cr_test {

    public static testmethod void Contact_delete_cr_test()
    {
        Contact c = new Contact(lastname='test name');
        insert c;
        Contact cdel= [SELECT id,name FROM Contact WHERE id=:c.Id];
        Contact_Relationship__c cr = new Contact_Relationship__c(name='test name cr');
        cr.Contact__c= c.id;
        insert cr;
//        list<contact_relationship__c> cr = [select id,name from contact_relationship__c where contact__c=:c.Id];
        
        delete cdel;
        
    }
}