trigger RisqueEntiteTrigger on Risque_Entite__c (before insert, before update, after insert) {
    //reccuperer la liste des risques
    List<Id> risqueIds=new List<Id>();
    for(Risque_Entite__c risqueEntite:Trigger.new){
        risqueIds.add(risqueEntite.Risque__c);
    }
    Map<Id,Risque__c> risques=new Map<Id,Risque__c>([select Id,Name from Risque__c]);
    if(Trigger.isBefore){
        for(Risque_Entite__c risqueEntite:Trigger.new){
            risqueEntite.Name=risques.get(risqueEntite.Risque__c).Name;
        }
    }
    if(Trigger.isAfter && Trigger.isInsert){
        List<Impact__c> impacts=new List<Impact__c>();
        Map<Id, Risque_Entite__c> risqueEntites=new Map<Id,Risque_Entite__c>();
        for(Risque_Entite__c risqueEntite:Trigger.new){
            risqueEntites.put(risqueEntite.Risque__c, risqueEntite);
        }
        RisqueEntiteManagement manager=RisqueEntiteManagement.getInstance();
        insert manager.getImpactRisqueEntite(risqueEntites);
       // insert manager.getMesurePreventionRisqueEntite(risqueEntites);
    }
}