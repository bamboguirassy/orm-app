({
	doInit: function(component, event, helper) {
        $A.createComponent(
            "c:ChartNombreRisqueByCategorie", {

            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateTochartNombreRisqueByCategorie: function(component, event, helper) {
        $A.createComponent(
            "c:ChartNombreRisqueByCategorie", {

            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateTochartNombreRisqueByEntite: function(component, event, helper) {
        $A.createComponent(
            "c:ChartNombreRisqueByEntite", {

            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateTochartRisqueByEntiteByAnnee: function(component, event, helper) {
        $A.createComponent(
            "c:ChartRisqueByEntiteByAnnee", {

            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateTochartRisqueByUserByEntite: function(component, event, helper) {
        $A.createComponent(
            "c:ChartRisqueByUserByEntite", {

            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateTochartRisqueEntiteByRisque: function(component, event, helper) {
        $A.createComponent(
            "c:ChartRisqueEntiteByRisque", {

            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateTochartRisqueEnEntreeByProcessus: function(component, event, helper) {
        $A.createComponent(
            "c:ChartRisqueEnEntreeByProcessus", {

            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToChartRisqueEntiteByCotationByEntite: function(component, event, helper) {
        $A.createComponent(
            "c:ChartRisqueEntiteByCotationByEntite", {

            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    }
})