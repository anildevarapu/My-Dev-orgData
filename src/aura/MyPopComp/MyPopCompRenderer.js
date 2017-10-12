({
    afterRender: function(component) {
        var concreteCmp = component.getConcreteComponent();
        var _helper = concreteCmp.getDef().getHelper();
        var target = _helper.getTargetComponent(component);
      var trigger = _helper.getTriggerComponent(component);

      if (target && trigger) {
            var targetElement = _helper.findElement(trigger, "popupTriggerElement");
            if (targetElement) {
                target.set("v.referenceElement", targetElement);
            }
      }

      this.superAfterRender();
    }
})// eslint-disable-line semi