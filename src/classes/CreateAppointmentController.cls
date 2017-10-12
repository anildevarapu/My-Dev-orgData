Public class CreateAppointmentController {
public lead Lde{get;set;}
public event evt{get;set;}
public id optId{get;set;}

public CreateAppointmentController(){

string LeadId = ApexPages.currentPage().getParameters().get('id');

system.debug('---------------This is Lead Id-----------'+LeadId );

 lde = [select id,FirstName,LastName,Street,City,State,PostalCode,Owner.Id,Owner.FirstName,Owner.LastName,Owner.Email,Owner.Phone from lead where id=:LeadId  limit 1];
 evt = new event();
 evt.OwnerId = lde.OwnerId;
}

Public void InsertEvent(){

/*if(!Test.isRunningTest()) {
update Lde;
}*/

Database.LeadConvert lc = new Database.LeadConvert();
lc.setLeadId(Lde.id);

LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
lc.setConvertedStatus(convertStatus.MasterLabel);



Database.LeadConvertResult lcr = Database.convertLead(lc);

 optId = lcr.getOpportunityId();

system.debug('----OptId------'+optId);

System.debug('----dbg----'+lcr.isSuccess());

string strdt= Apexpages.currentpage().getparameters().get('stdte');
string endt= Apexpages.currentpage().getparameters().get('edte');
string eml = Apexpages.currentpage().getparameters().get('eml');

    
    
    
    system.debug('=======Start Date====='+strdt);
    system.debug('=======EndDate====='+endt);
    system.debug('=======Email====='+eml);
    
    system.debug('=======System Date time====='+System.now());
    //Datetime dtee = DateTime.parse('2016/02/02 07:00 AM');
    //system.debug('------Test Parse-'+dtee );
    
    Datetime dtst = DateTime.valueOf(strdt);
    Datetime dtedt = DateTime.valueOf(endt);
    
    system.debug('------DateTime Parese St-'+dtst);
      system.debug('------DateTime Parese St-'+dtedt);
      
      evt.OwnerId = lde.OwnerId;
      evt.EndDateTime = dtedt;
      evt.StartDateTime = dtst;
      
      
      
      insert evt;
    
    
    
    
}


public pagereference gotoOpt() {

 PageReference accc = new PageReference('/'+optId);
      accc.setRedirect(true);

      return accc;

}



}