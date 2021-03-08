trigger merchandisetr on Merchandise__c (before insert,after insert,before update, after update, before delete, after delete, after undelete) {

/*if(trigger.isdelete && trigger.isafter)
{
System.debug('inside');
merchandiseinsert.insertmer(trigger.old);
}*/
    List<Merchandise__c > mlist = new List<Merchandise__c >();
    if(Trigger.IsInsert){
        if(Trigger.isBefore){
            System.debug('Inside before insert===');
        }
        if(Trigger.isAfter){
            System.debug('Inside after insert===');
        }
    }
    if(Trigger.Isupdate){
     /*   if(Trigger.isBefore){
            System.debug('Inside before update===');
        }*/
        if(Trigger.isAfter){
            System.debug('Inside after update===');
            for(Merchandise__c m : trigger.old){
                Merchandise__c m1 = new Merchandise__c (id=m.id, name= m.name + '1');
                //upsert m1;
            }
            Merchandise__c m = [select id,name,Merchandise_Price__c  from Merchandise__c where id = 'a076F00001A3dbi' limit 1];
            Merchandise__c m1 = new Merchandise__c(id=m.id, name=m.name,Merchandise_Price__c=600);
            upsert m1;
            
/*            for(Merchandise__c m : trigger.new){
                Merchandise__c m1 = new Merchandise__c (id=m.id, name= m.name + '2');
                update m1;
            }
            for(Merchandise__c m : trigger.new){
                Merchandise__c m1 = new Merchandise__c (id=m.id, name= m.name + '3');
                update m1;
            }*/
            
        }
    }
}