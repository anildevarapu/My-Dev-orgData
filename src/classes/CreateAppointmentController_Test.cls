@istest
public class CreateAppointmentController_Test {
static testmethod void CreateAppointment(){

 Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
      User u = new User(Alias = 'standt', Email='staner@teg.com', 
      EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
      LocaleSidKey='en_US', ProfileId = p.Id, 
      TimeZoneSidKey='America/Los_Angeles', UserName='staner@teg.com');

      System.runAs(u) {
      
 Lead lead = new Lead();
        lead.FirstName='Trigger1';
        lead.LastName='Test1';
        lead.Company='Trigger Test1';
        lead.status = 'Open - Not Contacted';
        insert lead;
        
        
        
         /*Database.LeadConvert lc = new database.LeadConvert();
     lc.setLeadId(lead.Id);

     LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=false LIMIT 1];
     lc.setConvertedStatus(convertStatus.MasterLabel);
     lc.setConvertedStatus('Closed - Converted');
     
     Database.LeadConvertResult lcr = Database.convertLead(lc);*/
            
            ApexPages.currentPage().getParameters().put('id', lead.id);
           
            CreateAppointmentController crt = new CreateAppointmentController();
            
            
            
            
                Apexpages.currentpage().getparameters().put('stdte','2016-02-03 16:15:00');
                 Apexpages.currentpage().getparameters().put('edte','2016-02-03 16:30:00');
                Apexpages.currentpage().getparameters().put('eml','kishore@gml.com');
                
                crt.InsertEvent();
                
                crt.gotoOpt();

                
                
                
      }





}


}