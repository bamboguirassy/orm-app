({
    doInit: function(component, event, helper) {
        $A.createComponent(
            "c:Dashboard", {
                
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToRisqueEntiteShow: function(component, event, helper) {
        $A.createComponent(
            "c:RisqueEntiteShowCmp", {
                "Id": event.getParam("Id")
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToRiskManagerShow: function(component, event, helper) {
        $A.createComponent(
            "c:RiskManagerShowCmp", {
                "Id": event.getParam("Id")
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToParamRisqueEntiteShow: function(component, event, helper) {
        $A.createComponent(
            "c:ParamRisqueEntiteShowCmp", {
                "Id": event.getParam("Id")
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToActiviteShow: function(component, event, helper) {
        $A.createComponent(
            "c:ActiviteShowCmp", {
                "Id": event.getParam("Id")
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToActivitePreventiveShow: function(component, event, helper) {
        $A.createComponent(
            "c:ActivitePreventiveShowCmp", {
                "Id": event.getParam("Id")
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    
    navigateToActiviteList: function(component, event, helper) {
        $A.createComponent(
            "c:ActiviteListCmp", {
                
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToProcessusShow: function(component, event, helper) {
        $A.createComponent(
            "c:ProcessusShowCmp", {
                "Id": event.getParam("Id")
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToPartieConcerneeShow: function(component, event, helper) {
        $A.createComponent(
            "c:PartieConcerneeShowCmp", {
                "Id": event.getParam("Id")
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToRisqueList: function(component, event, helper) {
        $A.createComponent(
            "c:RisqueListCmp", {
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
        navigateToProjetList: function(component, event, helper) {
        $A.createComponent(
            "c:ProjetListCmp", {
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToProcessusList: function(component, event, helper) {
        $A.createComponent(
            "c:ProcessusListCmp", {
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    
    navigateToEntiteList: function(component, event, helper) {
        $A.createComponent(
            "c:EntiteListCmp", {
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToCategorieRisqueList: function(component, event, helper) {
        $A.createComponent(
            "c:CategorieRisqueListCmp", {
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToCategorieMesurePreventionList: function(component, event, helper) {
        $A.createComponent(
            "c:CategorieMesurePreventionListCmp", {
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToCategorieImpactList: function(component, event, helper) {
        $A.createComponent(
            "c:CategorieImpactListCmp", {
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToRisqueEntiteList: function(component, event, helper) {
        $A.createComponent(
            "c:RisqueEntiteListCmp", {
                
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToEntiteShow: function(component, event, helper) {
        $A.createComponent(
            "c:EntiteShowCmp", {
                "Id": event.getParam("Id")
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
       navigateToProjetShow: function(component, event, helper) {
        $A.createComponent(
            "c:ProjetShowCmp", {
                "Id": event.getParam("Id")
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToPlanActionShow: function(component, event, helper) {
        $A.createComponent(
            "c:PlanActionShowCmp", {
                "Id": event.getParam("Id")
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToPlanActionPreventifShow: function(component, event, helper) {
        $A.createComponent(
            "c:PlanActionPreventifShowCmp", {
                "Id": event.getParam("Id")
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToPlanActionList: function(component, event, helper) {
        $A.createComponent(
            "c:PlanActionListCmp", {
                
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToRisqueShow: function(component, event, helper) {
        $A.createComponent(
            "c:RisqueShowCmp", {
                "Id": event.getParam("Id")
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
    navigateToEntiteList: function(component, event, helper) {
        $A.createComponent(
            "c:EntiteListCmp", {
                
            },
            function(newCmp) {
                if (component.isValid()) {
                    component.set("v.body", newCmp);
                }
            }
        );
    },
})