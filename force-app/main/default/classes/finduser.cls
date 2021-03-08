public with sharing class finduser
{
    public string keyword{set;get;}
    public List<user> usrde {set;get;}
    public String param1 { get; set; }
    public String param2 { get; set; }
    public void search()
    {
       String k = keyword + '%';  
       usrde = [select id,Alias,name,email,isactive,username from user where name like :k];
       system.debug(param1);
    }
    public PageReference deactuser()
    {
       User u1 =[select id,name,isactive from user where id=:param2];
       u1.IsActive=false;
       update u1;
           
        return null ;
    }
    public pagereference resetpwrd()
    {
     
        system.resetPassword(param1,true);
        return null;
    
    }
}