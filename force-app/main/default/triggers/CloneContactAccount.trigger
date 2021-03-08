trigger CloneContactAccount on Account (after Update) {
    
    List<Id> oldAccountId = new List<Id>();
    List<Account> newAccountList = new List<Account>();
    for(account a :trigger.new){
        oldAccountId.add(a.id);
        Account newAccount = a.clone();
        newAccount.name = a.name + ' clone';
        newAccountList.add(newAccount);
    }
    Database.SaveResult[] srList = Database.insert(newAccountList);
    
    map<id,id> oldaccidnewaccid = new map<id,id>();
    for(integer i=0;i<srList.size();i++){
        if(srList[i].isSuccess()){
            oldaccidnewaccid.put(oldAccountId[i],srList[i].getId());
        }
    }
    map<id,list<contact>> mapcon = new map<id,list<contact>>();
    list<contact> listcon = new list<contact>();

    for(contact c:[select id,name,firstname,lastname,accountid from contact where accountid in :oldAccountId]){
         if(mapcon.containskey(c.accountid)){
             mapcon.get(c.accountid).add(c);
         }else{
             List<contact> c1 = new List<contact>();
             c1.add(c);
             mapcon.put(c.accountid,c1);// id and contacts
         }
    }           
    
    for(Id i : mapcon.keyset()){
        if(mapcon.get(i).size()>0){
            for(contact c : mapcon.get(i)){
                contact c1 = new contact();
                c1=c.clone();
                c1.firstname= c.firstname + ' clone';
                c1.lastname= c.lastname + ' clone';
                c1.accountid = oldaccidnewaccid.get(i);
                listcon.add(C1);
            }
        }
    }
            
    database.saveresult[] srlist1 = database.insert(listcon);
}