/*
 * 
 * 
 */
public class RisqueEntiteManagement {
    private static RisqueEntiteManagement instance;
    
    private RisqueEntiteManagement(){
        
    }
    
    public static RisqueEntiteManagement getInstance(){
        if(instance==null){
            instance=new RisqueEntiteManagement();
        }
        return instance;
    }
    //return mesure prevention risque detecte according ti the risque entite
    public List<Mesure_Prevention_Risque_Detecte__c> getMesurePreventionRisqueEntite(Map<Id,Risque_Entite__c> risqueEntites){
        List<Mesure_Prevention__c> mesurePreventions=[select CategorieMesurePrevention__c,Name, Description__c,Risque__c from Mesure_Prevention__c where Risque__c in :risqueEntites.keySet()];
        List<Mesure_Prevention_Risque_Detecte__c> mesureRDs=new List<Mesure_Prevention_Risque_Detecte__c>();
        for(Mesure_Prevention__c mesurePrev:mesurePreventions){
            mesureRDs.add(new Mesure_Prevention_Risque_Detecte__c(mesure_Prevention__c=mesurePrev.Id));
            //risque_Detecte__c=risqueEntites.get(mesurePrev.Risque__c).Id
        }
        
        return mesureRds;
    }
    
    //return impact risque detecte according to the risque entite
    public List<Impact_Risque_Entite__c> getImpactRisqueEntite(Map<Id,Risque_Entite__c> risqueEntites){
        List<Impact__c> impacts=[select Categorie_Impact__c,Name, Description__c,Risque__c from Impact__c where Risque__c in :risqueEntites.keySet()];
        List<Impact_Risque_Entite__c> impactRDs=new List<Impact_Risque_Entite__c>();
        for(Impact__c impact:impacts){
            impactRDs.add(new Impact_Risque_Entite__c(impactRisque__c=impact.Id,risque_Entite__c=risqueEntites.get(impact.Risque__c).Id));
        }
        
        return  impactRds;
    }
}