global class Batch_Class_Sample_Scheduler implements Schedulable {

/**
    public static string sched = '00 00 00 * *?';
    
    global static string scheduleMe()
    {
        Batch_Class_Sample_Scheduler sh = new Batch_Class_Sample_Scheduler();
        return System.schedule('MyJob',sched,sh);
    }
        
**/        
    global void execute(Schedulablecontext sc)
    {
        Batch_Class_Sample bc = new Batch_Class_Sample();
        Database.executeBatch(bc);
    }
     
}