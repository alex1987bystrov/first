@isTest
public class TestFactoryLeadsMy {
    public static Lead getLeads(String Company, String Country, String FirstName, String LastName, Boolean doInsert) {
        Lead a = new Lead(Company = Company, Country = Country, FirstName = FirstName, LastName = LastName);
        if(doInsert) {
          insert a;
        }
        return a;
      }
}