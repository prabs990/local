public with sharing class AccountController {
  public static List<Account> getAllActiveAccounts() {
    return [SELECT Id,Active__c FROM Account WHERE Active__c = 'Yes'];
  }
}