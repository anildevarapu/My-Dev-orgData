({	
    loadOppertunities : function(component, event, helper){        
        var action = component.get("c.getAccounts");
        component.set("v.editBool",true);
        component.set("v.massUpdateLabel","Edit All");
        component.set("v.showAll",true);
        component.set("v.showCreate",false);
        component.set("v.showEdit",false);
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                component.set("v.accounts", response.getReturnValue());
            }
        });
	 $A.enqueueAction(action);
    },
    editAll:function(component, event, helper)
    {        
        var lbl = component.get("v.massUpdateLabel");
        if(lbl == "Edit All")	//click on edit
        {
            component.set("v.editBool",false);
     		component.set("v.massUpdateLabel","Save All");
        }
        else	//click on save
        {
            component.set("v.editBool",true);
     		component.set("v.massUpdateLabel","Edit All");
            var accounts = component.get("v.accounts");
            console.log(accounts);
            var accStr = JSON.stringify(accounts);
            var saveAll = component.get("c.saveAll");
            saveAll.setParams({
                "accStr":accStr
            });
            console.log(saveAll.getParams().accStr);
            saveAll.setCallback(this, function(response){
                var state = response.getState();
                if (state === "SUCCESS") {
                    component.set("v.accounts", response.getReturnValue());
                }
        	});
            $A.enqueueAction(saveAll);
        }
    },
    createNew:function(component, event, helper){
        component.set("v.showAll",false);
        component.set("v.showCreate",true);
        component.set("v.acc",{'Name':'','Industry':'','NumberOfEmployees':''});
    },
    editRec:function(component, event, helper){
        component.set("v.showAll",false);
        component.set("v.showCreate",true);
    },
    save:function(component, event, helper){
        var save = component.get("c.saveAccount");
        save.setParams({
            "acc" : component.get("v.acc")
        });   
        var load = component.get("c.getAccounts");
        load.setCallback(this, function(response){
            var state2 = response.getState();
            if (state2 === "SUCCESS") {
                component.set("v.accounts", response.getReturnValue());
                component.set("v.showAll",true);
        		component.set("v.showCreate",false);
            }
        });	 
        save.setCallback(this, function(response){
            var state1 = response.getState();
            if (state1 === "SUCCESS") {
                alert();
                $A.enqueueAction(load);
            }
        });
        $A.enqueueAction(save);
        
        
     	
    },
    cancel:function(component, event, helper){}
})