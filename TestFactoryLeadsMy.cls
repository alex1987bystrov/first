@isTest
public class TestFactoryLeadsMy {
    public static Lead getLeads(String Company, String Country, String FirstName, Boolean doInsert) {
        Lead a = new Lead(Company = Company, Country = Country, FirstName = FirstName);
        if(doInsert) {
          insert a;
        }
        return a;
      }
}