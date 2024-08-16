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
}