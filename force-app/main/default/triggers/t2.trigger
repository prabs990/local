trigger t2 on Contact(before insert, before update, after Update, after delete){

/*    
    if(trigger.IsInsert||trigger.Isupdate){
        contact_service.calculate(trigger.new);
    }
    if(trigger.IsUpdate||Trigger.IsDelete){
        contact_service.calculate(trigger.old);
    }   

    if(Trigger.isInsert){
        System.debug('before insert');
        for(contact c : trigger.new){
            System.debug('TodayDateFormula__c==='+c.TodayDateFormula__c);
            System.debug('CustomAccount__c==='+c.CustomAccount__c);
            System.debug('CustomAccount__r.name==='+c.CustomAccount__r.name);
            System.debug('formulafield__c==='+c.formulafield__c);            
        }
    }
*/
    if(Trigger.isInsert && Trigger.isBefore){
        for(contact c:trigger.new){
            if(c.level__c!=null){
                String level = c.Level__c;
                AllowedRoles__c a1 = AllowedRoles__c.getInstance(level);
                c.Role__c = a1.Role__c;
            }else {
                c.Role__c = '';
            }
        }
    }    
}