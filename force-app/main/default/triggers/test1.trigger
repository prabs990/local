trigger test1 on Contact (before Update,after update,before insert,after insert) {
    
      if(trigger.isInsert && trigger.isbefore){
          System.debug('Inside before insert===');  
      }  

      if(trigger.isInsert && trigger.isAfter){
          System.debug('Inside after insert===');  
      }  
      if(trigger.isUpdate && trigger.isbefore){
          system.debug('inside before update===');
      }
      if(trigger.isUpdate && trigger.isafter){
          system.debug('inside after update===');
      }      
 //   UserUpdate.updateUserMethod(trigger.new);
}