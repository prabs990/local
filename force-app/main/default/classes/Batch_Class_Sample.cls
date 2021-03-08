global class Batch_Class_Sample implements database.stateful ,Database.Batchable<Account>{

    List<Account> accList ;
    
    global Batch_Class_Sample(List<Account> accList1){
        accList = accList1;
    }
    
    global Iterable<Account> start(Database.BatchableContext bc){
        return accList;
    }
    
    global void execute(Database.BatchableContext bc, List<Account> accList2){
     
        System.debug('accList2==='+accList2);
    }
    
    global void finish(Database.BatchableContext bc){

    }
}