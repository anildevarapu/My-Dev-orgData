public without sharing class  CalendarViewOfTaskSAndEvents {
        
        
   public string viewType{get;set;}
   public string SelectedObj{get;set;}
   public Task tskobj{get;set;} 
   public Task TaskVar{get;set;}
   public boolean showtask{get;set;}
   public event evt{get;set;}
   public boolean showevnt{get;set;}
   public boolean showevnts{get;set;}
   public list<string> recdtypids;
   public map<string,string> recdtymap;
   public boolean filtercal;
   public string EvntSel{get;set;}
   public string TaskSel{get;set;}
  

    public boolean ShowRecentTaskEdit{get;set;}
   public boolean ShowRecentEventEdit{get;set;}
   public boolean ShowRecentEvent{get;set;}
   public boolean ShowRecentTask{get;set;}
   
   public Event RecentlyModEvent{get;set;}
   public Task RecentlyModTask{get;set;}
    
   public CalendarViewOfTaskSAndEvents(){
            
    SelectedObj = 'Event';
     viewType = 'Team View';   
     EvntSel = 'Event';
     TaskSel = 'Task';
     //showevnts = true; 
      
     

     
       getEvents();     
    }
    public String getEvents(){   
    
    
    string eventsQuery;
    String JSONString ='';
         List<cEvent> eventsList = new List<cEvent>();
     List<TaskWraper> TaskList = new List<TaskWraper>();
         try {
    
    eventsQuery = 'select '+ getQueryFields(SelectedObj);
      eventsQuery +=' from ' + SelectedObj; 
      string userids = '00528000001VtWb';
                  if(viewType=='My View'){
                system.debug('----@nil---My View Filtered Query-- '+viewtype);
                eventsQuery += ' Where ownerId = \''+ userids +'\'';
                system.debug('----@nil---Query String With My View-- '+eventsQuery );
            }
System.debug('event Query is: '+ eventsQuery);    
          
     
      

     TimeZone tzone = UserInfo.getTimeZone(); 
    /*TimeZone tzone = TimeZone.getTimeZone('America/Los_Angeles');*/
     String tz = tzone.getID();
    
      System.debug('time zone :'+ tz);
        

            


datetime myDateTime = datetime.now().addSeconds(-1);

RecentlyModEvent = new Event();
RecentlyModEvent = [select id,Subject,type,StartDateTime,EndDateTime,DurationInMinutes,Description,LastModifiedDate from event where LastModifiedDate>=:myDateTime OR LastModifiedDate<:myDateTime order by LastModifiedDate desc limit 1];



RecentlyModTask = new Task();
 RecentlyModTask = [ select id,Subject,Type,ActivityDate,Status,Priority,Description,LastModifiedDate from Task 
 where LastModifiedDate>=:myDateTime OR LastModifiedDate<:myDateTime order by LastModifiedDate desc limit 1 ];

 
            for(sObject e: Database.query(eventsQuery)){
            
     
            //system.debug('Subject------@nil-- '+e.get('subject'));
            if(SelectedObj == 'Event' && String.ValueOF(e.getSObjectType()) == SelectedObj){
                  if(RecentlyModEvent!=null){ShowRecentEvent = true;}


        
            cEvent cE = new cEvent();

            integer intg = Integer.valueOf(math.random() *789589*math.random() );

                  cE.allDay = false;
              cE.url = e.Id;
              cE.timezoneParam = tz; 
              cE.sobj = string.ValueOF(e.getSObjectType());
            
cE.title =(string) e.get('subject'); 
cE.id = (string) e.get('id'); 
cE.start = ((DateTime)e.get('StartDateTime')).AddSeconds(tzone.getOffset((DateTime)e.get('StartDateTime'))/1000);

cE.pEnd = ((DateTime)e.get('EndDateTime')).AddSeconds(tzone.getOffset((DateTime)e.get('EndDateTime'))/1000);
 cE.color =  '#'+String.valueOf(intg);
     
eventsList.add(cE); 
 
                 
                system.debug('--Event list Page load --- '+eventsList);
                system.debug('--Event list Page load --- '+eventsList.size()); 
}
     

            
            else if(SelectedObj == 'Task' && String.ValueOF(e.getSObjectType()) == SelectedObj ){
                    
                    if(RecentlyModTask!=null){ShowRecentTask = true;}
                 
                
            
            
            TaskWraper tsk = new TaskWraper();
            integer intg = Integer.valueOf(math.random() *789589*math.random() );

            tsk.allDay = true;
            tsk.url = e.Id;
            tsk.timezoneParam = tz; 
            tsk.sobj = string.ValueOF(e.getSObjectType());

            tsk.title =(string) e.get('subject'); 
            tsk.id = (string) e.get('id');

            tsk.color = '#'+String.valueOf(intg);

            tsk.start = (DateTime)e.get('ActivityDate');

            tsk.pEnd = (DateTime)e.get('ActivityDate');    

            TaskList.add(tsk); 
         
              
                system.debug('--Task list Page load --- '+TaskList);
                system.debug('--Task list Page load --- '+TaskList.size()); 
            

        
            
          }


      
          
          
    
    }
        }
    
                catch(exception ex){
                
                
                system.debug('--Exception Cause--'+ex.getCause());
                system.debug('--Exception Line--'+ex.getLineNumber());
                system.debug('--Exception message--'+ex.getMessage());
                system.debug('--Exception Stack trace--'+ex.getStackTraceString());
                system.debug('--Exception Type of excep--'+ex.getTypeName());   
            }
   
   
            if(SelectedObj == 'Event'){
            JSONString = JSON.serialize(eventsList);

            JSONString = JSONString.replaceAll('pEnd', 'end');

            System.debug('json string returned For @@@ Events '+ JSONString);

            return JSONString;     
            }
            else {
            if(SelectedObj == 'Task'){

            JSONString = JSON.serialize(TaskList);

            JSONString = JSONString.replaceAll('pEnd', 'end');

            System.debug('json string returned For @@@ Tasks '+ JSONString);


            }
            return JSONString;
            }         

  
    
    }


    
    private static DateTime getDateTime(String dt){
        
        DateTime outDateTime ; 
        
        if(dt.contains('T') && dt.endsWith('Z') ){
            
           Pattern MyPattern = Pattern.compile('(.*)T(.*)Z');

           Matcher MyMatcher = MyPattern.matcher(dt);


           if(MyMatcher.matches()){
  
            outDateTime =   DateTime.valueOf(MyMatcher.group(1)+' '+MyMatcher.group(2)) ;
    
           }
     
        }   
        
        return outDateTime; 
    }
    

    public pagereference editevent(){
    
    string evid = ApexPages.currentPage().getParameters().get('evntid');
    string objct = ApexPages.currentPage().getParameters().get('sfobj');
    system.debug('--@nil---During Edit call-----Sobject ---'+objct+'--And Record Id ---'+evid);
    
    
    id recdid = ID.valueOf(evid );
    if(recdid!=null){
    if(objct=='Event'){
        evt = new event();
            
        evt = [select id,IsAllDayEvent,ActivityDate,Description,DurationInMinutes,EndDateTime,
        EventSubtype,Location,StartDateTime,Subject,ActivityDateTime,Type from event where id=:recdid limit 1]; 
        system.debug('-----@Event Retrived,----- '+evt);
        showevnt = true;
            
    }
    else if(objct=='Task'){ 
    tskobj = new Task();
    tskobj = [select Id,WhoId,WhatId,Subject,ActivityDate,Status,Priority,IsHighPriority,OwnerId,Description,Type,IsDeleted,AccountId,IsClosed,CreatedDate,CreatedById,LastModifiedDate,LastModifiedById,SystemModstamp,IsArchived,CallDurationInSeconds,CallType,CallDisposition,CallObject,ReminderDateTime,IsReminderSet,RecurrenceActivityId,IsRecurrence,RecurrenceStartDateOnly,RecurrenceEndDateOnly,RecurrenceTimeZoneSidKey,RecurrenceType,RecurrenceInterval,RecurrenceDayOfWeekMask,RecurrenceDayOfMonth,RecurrenceInstance,RecurrenceMonthOfYear,RecurrenceRegeneratedType,TaskSubtype from Task where id=:recdid limit 1];
    system.debug('-----@Task Retrived,----- '+evt);
    showtask = true;
    }
        
    }
    ShowEditViewOfEvents = false;
    ShowEditViewOfTasks = false;
    
ShowRecentTask = false;
    ShowRecentEvent= false;
    ShowRecentTaskEdit = false;
    ShowRecentEventEdit = false;

    return null;
    }
    

    
     public List<SelectOption> getItems() {
     
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('Team View','Team View'));
        options.add(new SelectOption('My View','My View'));
        return options;

    }

  
   

           public void filterevents(){
                   ShowRecentTask = false;
        ShowRecentEvent= false;
        ShowRecentTaskEdit = false;
        ShowRecentEventEdit = false;
           string filtr = apexpages.currentpage().getparameters().get('filterby');
           system.debug('-----Selected obj----In Filter call--- '+SelectedObj);
           
           system.debug('-----filter by-------'+filtr);
           system.debug('----@nil---ThisIsToIdentiFy ViewType-- '+viewtype);
           
        
         if(filtr!='' && SelectedObj!=''){

        
        filtercal = true;   
        getEvents();
        
        
        
        
         }
        

        else {
                
                if(SelectedObj!=''){
                filtercal = false; 
                getEvents();

                }
                else {
                system.debug('---Selected Obj Null while going to get Events method---- '+SelectedObj);
                SelectedObj = 'Event';
                filtercal = true; 
                getEvents();        
                    
                }
        
        }

        }
      
            
    public void ToggleCalendar(){
            filtercal = false;
                showevnt = false;
    showtask = false;
            ShowEditViewOfEvents = false;
    ShowEditViewOfTasks = false;
    
            ShowRecentTask = false;
        ShowRecentEvent= false;
        ShowRecentTaskEdit = false;
    ShowRecentEventEdit = false;
    if(SelectedObj!=null){
                    
    
    system.debug('----A SelectedObj in Toggle clndr Action-- '+SelectedObj); 
    
    getEvents();            
    }
else if(selectedObj==''){
    SelectedObj = 'Task';

system.debug('----A SelectedObj null to the controller--hence manually changed to-- '+SelectedObj); 
    getEvents(); 
  
}   

    }
    
    

    
        public pagereference EditEventOrTask(){
    
    string evid = ApexPages.currentPage().getParameters().get('evntid');
    string TypeOFObj = ApexPages.currentPage().getParameters().get('Objtype');
    
    Schema.SObjectType sc = Schema.getGlobalDescribe().get(TypeOFObj);
    string objname = string.valueOF(sc.getDescribe().getSobjectType());
    string EvntQry = 'select '+getQueryFields(objname);
    EvntQry +=' from ' + objname;   
    EvntQry += ' Where Id = \''+ evid +'\'';
    system.debug('---Query While Edit call---- '+EvntQry);
  
  
   for(sObject e: Database.query(EvntQry)){
        
        if(String.ValueOf(e.getSObjectType()) == 'Event'){
        showevnt = true;
        evt = (Event)e;
                
        }
        else if(String.ValueOf(e.getSObjectType()) == 'Task'){
        TaskVar = (Task)e;
        showevnt = false;
        showtask = true;
        }
        
   }
   system.debug('-----IF Event------showpbl--- '+showevnt+' And Event Returned '+evt);
   system.debug('-----IF Task------showtask--- '+showtask+' And Task Returned '+TaskVar);
   return null;
   
}

    /* For Updating Event, */
    public void Updatetasks(){
    try {
    
    system.debug('--Start Date time----'+tskobj.ActivityDate);
    
    
    
    /*datetime taskAct = tskobj.ActivityDate;
   
    datetime dtActiv = Datetime.newInstance(taskAct.year(), taskAct.month(),  taskAct.day(), taskAct.hour(), taskAct.minute(), taskAct.second()); 

    
    tskobj.ActivityDate = dtActiv;*/
     
    
    
    
    update tskobj;
    
    
    
    ShowEditViewOfTasks = false;

     SelectedObj = 'Task';
    getEvents();
    //showtask= true;
    //ShowRecentItems = false;

    }
    catch(exception ex){
        showtask= false;
    ShowRecentTask = false;
    ShowEditViewOfTasks = true;
    ApexPages.addMessages(ex);
    }
    
    }
    
    public void UpdateEvt(){  
    try {
    
    system.debug('--Start Date time----'+evt.StartDateTime);
    system.debug('--Start Date time----'+evt.EndDateTime);
    
    
    datetime evstart = evt.StartDateTime;
    datetime evendt = evt.EndDateTime;
    datetime dtstart = Datetime.newInstance(evstart.year(), evstart.month(),  evstart.day(), evstart.hour(), evstart.minute(), evstart.second()); //Année/Jour/Mois hh/mm/ss
    datetime dtend = Datetime.newInstance(evendt.year(), evendt.month(),  evendt.day(), evendt.hour(), evendt.minute(), evendt.second());
    
    evt.StartDateTime = dtstart;
     evt.EndDateTime = dtend;
    
    
    
    update evt;
    
    
    
    ShowEditViewOfEvents= false;
     SelectedObj = 'Event';
    getEvents();
    //ShowRecentItems = false;
    //showevnt = true;
    }
    catch(exception ex){
         showevnt = false;
    ShowRecentEvent = false;
    ShowEditViewOfEvents = true;
    ApexPages.addMessages(ex);
    }
    
    }
    
    /* For Cancel Update */
     public void CancelUpdate(){
    
    showevnt = false;
    showtask = false;
    ShowEditViewOfEvents = false;
    ShowEditViewOfTasks = false;
    if(SelectedObj !=''){
    filtercal = false;
    getEvents();        
    }
    else {
    SelectedObj = 'Event';
    
    filtercal = false;
    getEvents();
    }
    
    }
    
    /* Vraiables and Methods declared On 14th APR 16*/
    public boolean ShowEditViewOfEvents{get;set;}
    public boolean ShowEditViewOfTasks{get;set;}
    public boolean ShowRecentItems{get;set;}
    
    public void ToggleEditViewOfEvent(){
    
    showevnt = false;
    //showtask = false;
    showeditviewOfEvents = true;
    

    
    }
    public void ToggleEditViewOfTasks(){
    
    showtask = false;
    
    showeditviewOfEvents = false;
    ShowEditViewOfTasks = true;
    //showtask = false;
    

    
    }
    
   

       @testVisible private class cEvent{
        
        public   string id;
        public   String title; 
        public  Boolean allDay;
        public  DateTime start;
        
        /*
         * replace pEnd to 'end' in the json string, jQuery will accept endDate as end but "end" is a 
         * reserved word in appex. 
         */ 
        public  DateTime pEnd; 
        public  string url; 
        public string color;
        public String timezoneParam;
        public string rectype;
        public string sobj;
      
        public cEvent(){}
        
    }
    
        public void RecentlymodEditViewOfTasks(){
    
    ShowRecentTask = false;
    
    ShowRecentEvent = false;
    ShowRecentTaskEdit = true;
    //showtask = false;
    
    }
    
    
    public void RecentlymodEditViewOfEvents(){
    
    ShowRecentEvent = false;
    
    ShowRecentTask = false;
    ShowRecentEventEdit = true;
    //showtask = false;
    

    
    }
    
    
    public void UpdateRecentModEvt(){  
    try {
    
    system.debug('--Start Date time----'+RecentlyModEvent.StartDateTime);
    system.debug('--Start Date time----'+RecentlyModEvent.EndDateTime);
    
    
    datetime evstart = RecentlyModEvent.StartDateTime;
    datetime evendt = RecentlyModEvent.EndDateTime;
    datetime dtstart = Datetime.newInstance(evstart.year(), evstart.month(),  evstart.day(), evstart.hour(), evstart.minute(), evstart.second()); //Année/Jour/Mois hh/mm/ss
    datetime dtend = Datetime.newInstance(evendt.year(), evendt.month(),  evendt.day(), evendt.hour(), evendt.minute(), evendt.second());
    
    RecentlyModEvent.StartDateTime = dtstart;
     RecentlyModEvent.EndDateTime = dtend;
    
    
    
    update RecentlyModEvent;
    
    
    
    ShowRecentEventEdit = false;
     SelectedObj = 'Event';
    getEvents();
    //ShowRecentItems = false;
    //showevnt = true;
    }
    catch(exception ex){
    ShowRecentEventEdit = true;
    ShowRecentEvent = false;
    ApexPages.addMessages(ex);
    
    }
    
    }
    
        /* For Updating Recently Modified Task, */
    public void UpdateRecentModtasks(){
    try {
    
    system.debug('--Start Date time----'+RecentlyModTask.ActivityDate);
    
    update RecentlyModTask;
    
    
    
    ShowRecentTaskEdit = false;

     SelectedObj = 'Task';
    getEvents();
    //showtask= true;
    //ShowRecentItems = false;
    }
    catch(exception ex){
    showtask = false;
    ShowRecentTask= false;
    ShowRecentTaskEdit = true;
    ApexPages.addMessages(ex);
    }
    
    }
    
    
    
    
       @testVisible private class TaskWraper{
        
        public   string id;
        public   String title; 
        public  Boolean allDay;
        public  DateTime start; 
        public  DateTime pEnd; 
        public  string url; 
        public string color;
        public string rectype;
        public string sobj;
        public string timezoneParam;

        public TaskWraper(){}
        
    }
    
    
 public String getQueryFields(String objectName){
        
     String[] types = new String[]{objectName};

     Schema.DescribeSobjectResult[] results = Schema.describeSObjects(types);

     Schema.DescribeSobjectResult result = results[0]; 
     
     Set<String> tempfields =   result.fields.getMap().keySet();
     
     Map<String,Schema.SObjectField> fieldMap =  result.fields.getMap();
     String fields = '';
        
        for(String k: fieldMap.keySet()){
            
            String f =  fieldMap.get(k).getDescribe().getName();
            
            fields += f; 
            tempfields.remove(k);
            if(tempfields.size()>0){
                
                fields +=',';
            }
            
        }
        
        return fields;
    }
    
    
    
 }