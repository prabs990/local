public class dmlinsert {

    public List<contact> conList;
    
    public dmlinsert()
    {
        conList = new List<contact>();
    }
    
    public void insertrecords()
    {
        Contact c1 = new Contact(lastname='singh1' , email='kjh@hmhk.com');
        Contact c2 = new Contact(lastname='singh2', email='kjh@hmhk.com');
        Contact c3 = new Contact(lastname='singh3', email='kjhhmhk.com');
        conList.add(c1);
        conList.add(c2);
        conList.add(c3);
        
        Database.SaveResult[] lsr = database.insert(conList,false);
        for(Database.SaveResult sr : lsr)
        {
            if(!sr.isSuccess())
            {
                Database.Error err = sr.getErrors()[0];
				
                System.debug('err is =='+err.getMessage());
                System.debug('err is =='+err);
                System.debug('err is =='+err);
            }
            else
            {
                System.debug('record successfully inserted is ==='+ sr);
            }
        }
    }
}