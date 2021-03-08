@istest
public class cr_name_test {

    public static testmethod void cr_name_test()
    {
        Profile pId= [select id from Profile where name =: 'System Administrator'];
		User u= new User();
		u.LastName = 'Test User ';
		u.Alias = 'ta';
		u.Isactive =true;
		u.Username = 'testuseraccount@test.com';
		u.Email = 'testuser@test.com';
		u.CommunityNickname= 'TestCN';
		u.TimeZoneSidKey = 'America/Los_Angeles';
		u.LocaleSidKey='en_US';
		u.EmailEncodingKey= 'ISO-8859-1';
		u.ProfileId = pId.Id;
		u.LanguageLocaleKey = 'en_US';
		insert u;
		
        Contact_Relationship__c cr = new Contact_Relationship__c(name='alpha');
        insert cr;
//        Contact_Relationship__c cr1 =[select id,name from Contact_Relationship__c cr where id=:cr.Id];
        cr.OwnerId=u.id;
        update cr;
//        system.assertEquals(u.Id, cr.OwnerId);
        // why the below statement willn not work. What to check in system.assert equal since name is still not stored?
        user ur = [select id,name from user where id = :u.Id];
         system.assertEquals('Test User ',ur.name);
    }
}