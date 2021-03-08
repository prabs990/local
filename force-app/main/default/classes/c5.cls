Public class c5{

List<opportunity > acc = [select id,name,StageName from opportunity where StageName='Closed Won'];
List<opportunity > acc1 = [select id,name,StageName from opportunity where StageName<>'Closed Won'];

public List<opportunity > getacc(){
return acc;
}
public List<opportunity > getacc1(){
return acc1;
}

}