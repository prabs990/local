public class accountDatabaseUpdate{

    public static void updateAccount(List<Account> acc){

        list<account> accList = new List<Account>();        
        for(Account a : acc){
            a.phone= '';
            accList.add(a);
        }
        Database.saveResult[] srList = Database.update(accList);
        for(Database.saveresult sr : srList){
            if(!sr.issuccess()){
                for(Database.error err : sr.getErrors()){
                    System.debug('Error has occured');
                    System.debug(err.getStatusCode()+ '  '+err.getMessage());
                    System.debug(err.getFields());
                }            
            }
        }
    }
}