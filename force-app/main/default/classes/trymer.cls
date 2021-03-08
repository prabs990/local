public class trymer
{
    public merchandise__C mer{set;get;}
    
    public trymer()
    {
     mer=new merchandise__C();
    }
    
    public void doupsert()
    {
    list<merchandise__c> m= new list<merchandise__C>();
    m=[select id,name,Merchandise_Price__c from merchandise__c where name=:mer.name];
    if(m.size()<=0)
    {
       mer=new merchandise__C(name=mer.name,Merchandise_Price__c=10);
    }
    else
    {
        mer.Merchandise_Price__c=100;
    }
       upsert mer;
    }
    
  }