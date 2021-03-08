trigger cloneAccountContact on Account (after Update) {


        Map<String, List<Contact>> mapCon = new Map<String, List<Contact>>();
        List<Id> listAccId = new List<Id>();
        Map<String,String> mapOldNew = new Map<String,String>();
        List<Account> listAccCloned = new List<Account>();
                
        for(Account acc: Trigger.new){
            listAccId.add(acc.id); //get all account id in a set to fetch the contact
            
            Account a = new Account();
            a = acc.clone();
            a.name=acc.name + ' sample';
            listAccCloned.add(a);
        }
        
        Database.SaveResult[] srList = Database.insert(listAccCloned, false);
        
        for(Integer i=0;i<srList.size();i++){
            if(srList[i].isSuccess()){
                mapOldNew.put(listAccId[i],srList[i].getId()); // mapping of old account id to new account id
            }
        }
        
        for(Contact c:[select id, Name, firstname,lastname,AccountId from Contact where AccountId IN :listAccId]){
            if(mapCon.containsKey(c.AccountId)){
                mapCon.get(c.AccountId).add(c);
            }
            else{
                List<Contact> listCon = new List<Contact>();
                listCon.add(c);
                mapCon.put(c.AccountId,listCon);// mapping of old account id with contact list
            }
        }
        
        List<Contact> listConCloned = new List<Contact>();
        
        for(String str:mapCon.keySet()){
            if(mapCon.get(str).size() > 0){
                Contact con;
                for(Contact c:mapCon.get(str)){
                    con = new Contact();
                    con = c.clone();
                    con.firstname=c.firstname + ' sample';
                    con.lastname=c.lastname + ' sample';
                    con.AccountId = mapOldNew.get(str); // assign new Account Id from map in the Contact
                    listConCloned.add(con);
                }       
            }
        }
        
        Database.insert(listConCloned);
    
}