trigger CategorieMesurePreventionTrigger on Categorie_Mesure_Prevention__c (before delete) {
    if(Trigger.isBefore){
        if(Trigger.isDelete){
        
            List<Mesure_Prevention__c> mesurePreventions = new List<Mesure_Prevention__c>();
            
            for(Categorie_Mesure_Prevention__c  CategorieMP : Trigger.Old){
               //recuperation de la liste des 'mesures de prevention' pour chaque  Categorie_Mesure_Prevention
               mesurePreventions.addAll([select Id from Mesure_Prevention__c where  CategorieMesurePrevention__c=:CategorieMP.Id]);             
            }
            
            // suppression des listes mesures de prevention associes
            delete mesurePreventions;
        }       
    }
}