({
	afterScriptsLoaded : function(component, event, helper) {
		var g = new JustGage({
            id: "gauge",
            value: component.get('v.value'),
            min: 0,
            max: component.get('v.max'),
            title: "Criticité"
        });
	}
})