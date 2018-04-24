({
	navigateToShow: function(component, event, helper) {
        var item = helper.getSelectedItem(component, event);
        var evt = $A.get("e.c:navigateToRisqueEntiteShow");
        evt.setParams({
            "Id": item.Id
        });
        evt.fire();
    }
})