public class massUpdateApexCon {
  @AuraEnabled
    public static List<account> getAccounts() {
        List<account> accounts = 
                [SELECT Id, Name,Industry,NumberOfEmployees FROM account];
        return accounts;
    }
    @AuraEnabled
    public static account getAccount(string accId) {
        account acc = 
                [SELECT Id, Name,Industry,NumberOfEmployees FROM account where id=:accId];
        return acc;
    }
    @AuraEnabled
    public static void saveAccount(account acc) {
        insert acc;
    }
    @AuraEnabled
    public static list<account> saveAll(string accStr) {
        list<account> Accs = new list<account>();
        system.debug('before1..!'+accStr);
        accs = (list<account>)JSON.deserialize(accStr, list<account>.class);
        system.debug('before2..!'+accs);
        update accs;
        system.debug('after..!'+accs);
        return accs;
    }
    
    
    @AuraEnabled
   public static List<Opportunity> getOpportunities() {
       List<Opportunity> opportunities = 
               [SELECT Id, Name, CloseDate FROM Opportunity];
       return opportunities;
   }
}