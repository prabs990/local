@istest
public class salesrep_account_test {

    public static testmethod void salesrep_account_test()
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
		User u1 = [select id,name from user where id=:u.id];
        Account a = new account(name='test account', ownerid=u1.Id);
        insert a;
        
    }
}