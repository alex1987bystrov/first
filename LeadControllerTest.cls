@isTest
private class LeadControllerTest {
    @TestSetup
        static void dataCreation() {
        Lead a = TestFactoryLeadsMy.getLeads('Muddy Waters Inc.', 'USA', 'Mandy', 'Talor', true);
    }
    @IsTest
    static void testGetLeads() {
      List<Lead> leads;
      Test.startTest();
        leads = LeadController.getLeads();
      Test.stopTest();
      Assert.isTrue(leads.size() > 0, 'Was expecting to find at least one item');
    }
    @IsTest
    static void testGetCityById() {
      List<Lead> a = [SELECT Id, FirstName FROM Lead];
      String leadsById;
      Test.startTest();
        Id leadId = a[0].id;
        leadsById = LeadController.getCityById(leadId);
      Test.stopTest();
      Assert.isTrue(leadsById != '', 'Was expecting to not null');
    }
}