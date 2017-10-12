({
    doInit: function(component, event, helper) {
        helper = component.getConcreteComponent().getDef().getHelper();
        helper.setEventHandlersOnChildren(component, event);
    },

    onTriggerPress: function(component, event, helper) {
        //helper = component.getConcreteComponent().getDef().getHelper();
        helper = component.getConcreteComponent().helper;
        helper.handleTriggerPress(component, event);
    },

    onTargetShow: function(component, event, helper) {
        helper = component.getConcreteComponent().getDef().getHelper();
        helper.handleTargetShow(component, event);
    },

    onTargetHide: function(component, event, helper) {
        helper = component.getConcreteComponent().getDef().getHelper();
        helper.handleTargetHide(component, event);
    },

    onKeyboardEvent: function(component, event, helper) {
        helper = component.getConcreteComponent().getDef().getHelper();
        helper.handleKeyboardEvent(component, event);
    },

    onRefresh: function(component, event, helper) {
        helper = component.getConcreteComponent().getDef().getHelper();
        helper.handleRefresh(component, event);
    }
})// eslint-disable-line semi