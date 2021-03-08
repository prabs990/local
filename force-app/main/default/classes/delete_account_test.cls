@istest
public class delete_account_test {

    public static testmethod void delete_account_test1()
    {
        
        Profile pId= [select id from Profile where name =: 'New System Administrator'];
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
        system.runAs(u)
        {
        Account a= new Account(name='test account');
        a.OwnerId=u.id;
        insert a;
        Account a1=[SELECT id,name FROM account where id=:a.Id ];
        String addError='you are not admin so cannot delete';
        System.assertEquals('you are not admin so cannot delete',addError);
        try{
               
			Delete a1;
        }
            catch(Exception e)
            {
                System.debug('cath block');
            }
        }
        
        
        
//        In this case our test class is entering a.adderror message('you are not admin so cannot delete'). How to check this by system.assertequals
    }
}