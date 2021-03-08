public class Dog {
private integer age;
private string name;

public void setname(String name)
    {
    	this.name=name;
    }   
public void setage(integer age)
	{	
        if (age<=0)
        {
            age=10;
            this.age=age;
        }
        else
        {
    	this.age=age;
        }
	}
public String getname()
	{
        return name;
    }
    
public integer getage()
	{
        return age;
    }
}