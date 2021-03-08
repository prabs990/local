public class hew{


 
 list<merchandise__C> m = [select name,Merchandise_Price__c from merchandise__C where Merchandise_Price__c> 0];
  
 list<merchandise__c> m2 = [select name,Merchandise_Price__c from merchandise__C where Merchandise_Stock__c>0]; 
  public list<merchandise__C> getm(){
  return m;
  }
  public list<merchandise__C> getm2(){
  return m2;
  }
  public pagereference page9(){
  return page.page8;
  }
}