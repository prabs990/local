public class searchemployee
{
    public string education,state;
    public integer yoe;
    public integer j=5;
    list<employee__c> emp = new list<employee__c>();
    list<employee__c> emp1 = new list<employee__c>();
    public void seteducation(String edu)
    {
        education=edu;
    }
        public void setstate(String sta)
    {
        state=sta;
    }
        public void setyoe(integer yo)
    {
        yoe=yo;
    }
    
    public string geteducation()
    {
        return education;
    }
    
        public string getstate()
    {
        return state;
    }
    
        public integer getyoe()
    {
        return yoe;
    }
    
    public list<employee__c> getemp()
    {
        return emp;
    }
    
    public list<employee__c> getemp1()
    {
        return emp1;
    }

    public void search()
    {
        if(education=='' && state=='' && yoe!=0)
        {
            emp=[select name from Employee__c where Years_of_Experience__c=:yoe];
        }
        if(education=='' && state!='' && yoe==0)
        {
            emp=[select name from Employee__c where State_Province__c=:state];
        }
        if(education=='' && state!='' && yoe!=0)
        {
            emp=[select name from Employee__c where State_Province__c=:state and years_of_Experience__c=:yoe];
        }
        if(education!='' && state=='' && yoe==0)
        {
            emp=[select name from Employee__c where Education__c = :education];
        }
        if(education!='' && state=='' && yoe!=0)
        {
            emp=[select name from Employee__c where years_of_Experience__c=:yoe and Education__c = :education];
        }
        if(education!='' && state!='' && yoe==0)
        {
            emp=[select name from Employee__c where State_Province__c=:state and Education__c = :education];
        }        
        if(education!='' && state!='' && yoe!=0)
        {
            emp=[select name from Employee__c where State_Province__c=:state and Education__c = :education and years_of_Experience__c=:yoe];
        }        
        for(Employee__C e:emp)
        {   
            emp1.add(e);
            if (emp1.size()==5)
            {
            break;
            }
        } 
    }
    
    public void next()
    {      
         for(integer i=j;i<=i+5;i++)
           emp1.add(emp[i]);  
           j++; 
    }
}