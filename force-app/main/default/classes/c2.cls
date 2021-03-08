public class c2{

List<Opportunity> opr = [select id,name,StageName from Opportunity where StageName='Closed Won'];
public List<Opportunity> getopr()
{
    return opr;
}

}