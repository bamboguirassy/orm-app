({
    refreshList: function(component, event) {
        var action = component.get("c.findAll");
        action.setParam("risqueEntite", component.get('v.risqueEntite'));
        if (component.get('v.risqueEntite')) {
            action
                .setCallback(
                    this,
                    function(response) {
                        var state = response.getState();
                        if (state == "SUCCESS") {
                            component.set("v.items", response
                                .getReturnValue());
                        } else {
                            alert("Impossible de recuperer la liste des mesures de prevention des risque detectés");
                        }

                    });
            $A.enqueueAction(action);
        }
    }

})