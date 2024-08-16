public with sharing class LeadController {
    @AuraEnabled (cacheable=true)
    public static List<Lead> getLeads() {
      return [SELECT Address, AnnualRevenue, CleanStatus, Company, CompanyDunsNumber, ConvertedAccountId, ConvertedContactId, ConvertedDate, ConvertedOpportunityId, Country, CreatedById, CreatedDate, CurrentGenerators__c, DandbCompanyId, Description, Email, EmailBouncedDate, EmailBouncedReason, Fax, FirstName, GeocodeAccuracy, Id, IndividualId, Industry, IsConverted, IsDeleted, IsUnreadByOwner, Jigsaw, JigsawContactId, LastActivityDate, LastModifiedById, LastModifiedDate, LastName, LastReferencedDate, LastViewedDate, Latitude, LeadSource, Longitude, MasterRecordId, MobilePhone, Name, NumberOfEmployees, NumberofLocations__c, OwnerId, Phone, PhotoUrl, PostalCode, Primary__c, ProductInterest__c, Rating, SICCode__c, Salutation, State, Status, Street, SystemModstamp, Title, Website FROM Lead WITH SECURITY_ENFORCED LIMIT 49999];
    }
    @AuraEnabled (cacheable=true)
    public static String getCityById(String Id) {
      List<Lead> result = [SELECT Address FROM Lead WHERE Id = :Id WITH SECURITY_ENFORCED LIMIT 1];
      System.Address addr = result[0].Address;
      return (addr.City);
    }
}