({
myAction : function(component, event, helper) {

},
   loadOppertunities : function(component, event, helper){
       console.log(component);
       var action = component.get("c.getOpportunities");
       action.setCallback(this, function(response){
           var state = response.getState();
           if (state === "SUCCESS") {
               component.set("v.opportunities", response.getReturnValue());
               //alert(response.getReturnValue());
           }
       });
$A.enqueueAction(action);
   }
})