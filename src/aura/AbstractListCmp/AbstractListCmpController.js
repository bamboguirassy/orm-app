({
    doInit: function(component, event, helper) {
        if ($A.util.isEmpty(component.get('v.items'))) {
            helper.refreshList(component, event);
             
        }

         helper.getFieldLabels(component, event);

    },
    jsLoaded: function(component, event, helper) {
        alert();
    },
    showEditModal: function(component, event, helper) {
        var self = this;
        // for Display Model,set the "isOpen" attribute to "true"
        var itemToEdit = helper.getSelectedItem(component, event);
        if (itemToEdit) {
            component.set("v.editItem", itemToEdit);
            component.set("v.editComponentIsOpen", true);
            component.set("v.isEdit", true);
        }
    },
    removeItem: function(component, event, helper) {

        var index = event.target.dataset.index;        
        component.set('v.currentIndex', index);
        //component.set('v.currentIndex', event.target.dataset.index);
            helper.openDeleteConfirmationModel(component);

    },
    refreshList: function(component, event, helper) {
//         table = document.getElementById('table').DataTable();
//         table.destroy();
        helper.refreshList(component, event);

    },
    applyDatatable: function(component, event, helper) {
//     document.getElementById('table').DataTable(
//     {
//         dom: 'Bfrtip',
//         buttons: [
//         'copy', 'csv', 'excel', 'pdf', 'print'
//         ]
//         }
//         );
         //document.getElementById("table").tableExport();

    },
    confirmDeletion: function(component, event, helper) {
        var self = this; // safe reference

        /*var items = component.get("v.items");*/
        var paginationList = component.get("v.PaginationList");
        itemToRemove = paginationList[component.get('v.currentIndex')];
        if (itemToRemove) {
            helper.showSpinner(component);
            var cc = component.getConcreteComponent();
            var removeAction = cc.get("c.remove");
            removeAction.setParam("item", itemToRemove);
            removeAction.setCallback(this, function(response) {
                var deleteState = response.getState();

                if (deleteState == "SUCCESS") {
                    cc.getDef().getHelper().refreshList(cc,
                        event);
                    helper.hideSpinner(component);
                    helper.closeDeleteConfirmationModel(component);
                    helper.showToast('Success', itemToRemove.Name + " supprimé avec succés ", 'success'); } else { helper.showToast('Error',
                        "Echec suppression " + itemToRemove.Name, 'error');
                }

            });
            $A.enqueueAction(removeAction);
        } else {
            helper.showToast('Warning',
                "Aucun élement selectionné pour la suppression !",
                'warning');
        }
    },
   
    
    closeDeleteConfirmationModel: function(component, event, helper) {
        helper.closeDeleteConfirmationModel(component);
        //cacher le spinner
        helper.hideSpinner(component);
    },
    
    next: function (component, event, helper) {
	    helper.next(component, event);
	},
	    previous: function (component, event, helper) {
	    helper.previous(component, event);
	},
})