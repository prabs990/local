trigger formulacheck on Contact (after update) {
    
    for(Contact c :trigger.new){
        Contact oldC = trigger.oldmap.get(c.id);
        System.debug('trigger.old formulafield ==='+oldC.formulafield__c);
        System.debug('trigger.new formulafield ==='+c.formulafield__c);
        
    }

}