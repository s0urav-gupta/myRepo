@isTest
public class CallOpportunityBatchTest {
	@testSetup
    static void createData(){
        Account acc = new Account(Name = 'AccTest');
        insert acc;
        Opportunity opp = new Opportunity(
            							Name = 'OppTest', 
            							Amount = 500, 
            							CloseDate = system.today()+10, 
            							StageName = 'Prospecting',
        								AccountId = acc.Id);
        insert opp;
    }
    @isTest
    static void fetchOppId(){
        Test.startTest();
        Opportunity opp = [SELECT Id, Amount, AccountId FROM Opportunity WHERE Name = 'OppTest'];
        opp.StageName = 'Closed Won';
        update opp;
        Test.stopTest();
        Account acc = [SELECT Id, Total_Closed_Won_Amount__c FROM Account LIMIT 1];
        system.assertEquals(acc.Total_Closed_Won_Amount__c, opp.Amount);
    }
}