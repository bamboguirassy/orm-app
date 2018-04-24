({
    doInit: function(component, event, helper) {
        $A.createComponent(
            "c:DashboardRisque", {

            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    }
})