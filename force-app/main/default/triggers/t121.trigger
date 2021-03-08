trigger t121 on Account (after Update) {

        List<contact> cons = new List<contact>();
        
        List<Account> actList = new List<Account>();
        List<Contact> conList = new List<Contact>();        
        Map<ID,account> mapAdd = new Map<id,account>();
        Map<ID,List<contact>> mapAdd1 = new Map<id,List<Contact>>();
                
        for(Account a : trigger.new){
            Account a1 = new Account();
            a1.name= a.name + 'APA'; 
            mapAdd.put(a.id,a1);
            for(contact c : [select firstname,lastname,id,accountid from contact where accountid=:a.id]){
                cons.add(c);
            }
            system.debug('a.contacts==='+cons);
            mapAdd1.put(a.id,cons.clone());
            
            cons.clear();
            System.debug('mapadd is=== '+mapAdd);
            System.debug('mapadd1 is=== '+mapAdd1);
            
        }
          
        Insert mapAdd.values();
        
        for(Account a:trigger.new){
            System.debug('map values are==='+mapAdd1.get(a.id));
            for(contact c : mapAdd1.get(a.id)){
                system.debug('inside contact loop==='+c);
                Contact c1 = new contact();
                c1.lastname= c.lastname + ' BAA';
                c1.firstname=c.firstname+ ' BAA';
                System.debug('account id of new account is ==='+mapAdd.get(a.id).id);
                c1.accountId = mapAdd.get(a.id).id;
                conList.add(c1);
                System.debug('conlist is==='+conlist);
            }
        }
        
        insert conList;
/*        List<Contact> conAdd = new List<contact>();
        system.debug('map keyset is==='+mapAdd.keyset());
        for(Account a : mapAdd.keyset()){
            system.debug('you are reading account ==='+a);
            system.debug('mapadd.get ==='+mapadd.get(a));
            
            for(Contact con : mapAdd.get(a)){
                Contact c1 = new Contact();
                c1.firstname=con.firstname + ' APA';
                c1.lastname=con.lastname + ' APA';
                c1.accountId = a.id;
                conAdd.add(c1);
            }
        }
        
        Insert conAdd;
*/        
/*        
        List<Account> accList1 = [select id,name,(select id,firstname,lastname from contacts) from account where id in:accList];
        List<account> newAccList = new List<account>();
        List<contact> newConList = new List<contact>();
        
        for(account a : accList1){
            
            Account newAcc = new Account();
            
            newAcc.name = a.name + ' APA';
                
            newAccList.add(newAcc);
            
            for(Contact con : a.contacts){
                contact c1  = new contact();
                c1.firstname=con.firstname + ' APA';
                c1.lastname = con.lastname + ' APA';
                c1.accountId = newAcc.id;
                newConList.add(c1);     
            }
        }
        insert newAccList;
        insert newConlist;
*/        
}