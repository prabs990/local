@isTest
public class undelete_contact_test {

    public static testmethod void undelete_contact()
    {
        contact c = new contact(lastname='try1');
        insert c;
        contact_relationship__c cr = new contact_relationship__c(name='try cr1',Contact__c=c.id);
        insert cr;
        contact c1 = [SELECT id FROM contact WHERE id = :c.Id];
        delete c1;
		contact_relationship__c c2 = [SELECT id FROM contact_relationship__c WHERE id = :cr.Id];
        delete c2;
        undelete c1;
        list<contact_relationship__c> c3 = [SELECT id,name FROM contact_relationship__c WHERE name = 'try cr1'];
        system.assertEquals(1, c3.size());
    }
}