@istest

public class cr_contact_test {

    public static testmethod void cr_contact_test()
    {
      Contact c = new Contact(lastname='delya',Contact__c=true);
      insert c;
      Contact c1 = new Contact(lastname='delya',Contact__c=true);
      insert c1;
      List<Contact_Relationship__c> cr= [SELECT id,name FROM Contact_Relationship__c WHERE contact__c in (:c.Id,:c1.id)];
      system.assertEquals(2, cr.size());
      System.debug('cr.size===='+cr.size());  
    }
}