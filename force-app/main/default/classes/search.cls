public class search {

    String key;
    List<Merchandise__c> mer;
    boolean re=false;
    public string getkeyword()
    {
        return key;
    }
    public boolean getre(){
        return re;
    }
    public list<merchandise__c> getmer(){
        return mer;
    }
    public void setkeyword(String find)
{
    key=find;
}
    public void searchbutton()
    {   re=true;
        mer = (list<Merchandise__c>) [find :key in all fields returning Merchandise__c(name)][0];
    }
}