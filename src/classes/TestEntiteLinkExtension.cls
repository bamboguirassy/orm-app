@IsTest
public class TestEntiteLinkExtension {
    static testMethod void test(){
       /* //create an entity
        Account entite=new Account();
        entite.Name='Test1';
        Test.startTest();
        //insert entite
       	insert entite;
        
        System.assert(EntiteController.getElementById(entite.Id)!=null);
        System.assert(EntiteController.filterFromEntite(entite.Id).size()==0);
        System.assert(EntiteController.findAll().size()>0);
        
        
        //test user entite
        Contact userEntite=new Contact();
        userEntite.FirstName='Moussa';
        userEntite.LastName='Fofana';
        userEntite.AccountId=entite.Id;
        insert userEntite;
        
        
        //test categorie risque
        Categorie_Risque__c categorieRisque=new Categorie_Risque__c();
        categorieRisque.Name='Categorie de Test';
        CategorieRisqueController.add(categorieRisque);
        System.assert(categorieRisque.Id!=null);
        System.assert(CategorieRisqueController.findAll().size()>0);
        
        //test risque
        Risque__c risque=new Risque__c();
        risque.categorieRisque__c=categorieRisque.Id;
        risque.Name='Risque de test';
        RisqueController.add(risque);
        System.assert(risque.Id!=null);
        System.assert(RisqueController.findAll().size()>0);
        System.assert(RisqueController.filterFromCategorie(categorieRisque.Id).size()>0);
        System.assert(RisqueController.getCategorieRisques().size()>0);
        System.assert(RisqueController.getElementById(risque.Id)!=null);
        
        //test categorie impact
        CategorieImpact__c categorieImpact=new CategorieImpact__c();
        categorieImpact.Name='Categorie Impact de test';
        CategorieImpactController.add(categorieImpact);
        System.assert(categorieImpact.Id!=null);
        System.assert(CategorieImpactController.findAll().size()>0);
        //test categorie mesure prevention
        Categorie_Mesure_Prevention__c categorieMesurePrevention=new Categorie_Mesure_Prevention__c();
        categorieMesurePrevention.Name='Categorie Mesure de Prevention de Test';
        CategorieMesurePreventionController.add(categorieMesurePrevention);
        System.assert(categorieMesurePrevention.Id!=null);
        System.assert(CategorieMesurePreventionController.findAll().size()>0);
        //test impact risque
        Impact__c impactRisque=new Impact__c();
        impactRisque.Categorie_Impact__c=categorieImpact.Id;
        impactRisque.Name='Impact Risque';
        impactRisque.risque__c=risque.Id;
        ImpactRisqueController.add(impactRisque);
        System.assert(impactRisque.Id!=null);
        System.assert(ImpactRisqueController.findAll(risque.Id).size()>0);
        System.assert(ImpactRisqueController.filterFromCategorie(categorieImpact.Id, risque.Id).size()>0);
        System.assert(ImpactRisqueController.getCategorieImpacts().size()>0);
        //mesure prevention
        Mesure_Prevention__c mesurePreventionRisque=new Mesure_Prevention__c();
        mesurePreventionRisque.CategorieMesurePrevention__c=categorieMesurePrevention.Id;
        mesurePreventionRisque.Name='Mesure Prevention';
        mesurePreventionRisque.Risque__c=risque.Id;
        MesurePreventionController.add(mesurePreventionRisque);
        System.assert(mesurePreventionRisque.Id!=null);
        System.assert(MesurePreventionController.filterFromCategorie(categorieMesurePrevention.Id, risque.Id).size()>0);
        System.assert(MesurePreventionController.findAll(risque.Id).size()>0);
        System.assert(MesurePreventionController.getCategorieMesurePreventions().size()>0);
        //test risque entite
        Risque_Entite__c risqueEntite=new Risque_Entite__c();
        risqueEntite.Risque__c=risque.Id;
        risqueEntite.Entite__c=entite.Id;
        risqueEntite.frequence__c=1;
        risqueEntite.gravite__c=2;
        risqueEntite.maitrise__c=2;
        risqueEntite.responsable__c=userEntite.Id;
        
        RisqueEntiteController.add(risqueEntite);
        System.assert(risqueEntite.Id!=null);
        System.assert(RisqueEntiteController.filterFromCategorieEntite(categorieRisque.Id, entite.Id).size()>0);
        System.assert(RisqueEntiteController.filterFromCategorie(categorieRisque.Id).size()>0);
        System.assert(RisqueEntiteController.findAllByEntite(entite.Id).size()>0);
        System.assert(RisqueEntiteController.findAll().size()>0);
        System.assert(RisqueEntiteController.findRisques().size()>0);
        System.assert(RisqueEntiteController.findUserEntites(entite.Id).size()>0);
        System.assert(RisqueEntiteController.getCategorieRisques().size()>0);
        System.assert(RisqueEntiteController.getElementById(risqueEntite.Id)!=null);
        //test mesure prevention risque detecte
        Mesure_Prevention_Risque_Detecte__c mesurePreventionRD=new Mesure_Prevention_Risque_Detecte__c();
        mesurePreventionRD.mesure_Prevention__c=mesurePreventionRisque.Id;
        mesurePreventionRD.risque_Detecte__c=risqueEntite.Id;
        MesurePreventionRisqueDetecteController.add(mesurePreventionRD);
        System.assert(mesurePreventionRD.Id!=null);
        System.assert(MesurePreventionRisqueDetecteController.findAll(risqueEntite.Id).size()>0);
        System.assert(MesurePreventionRisqueDetecteController.getMesurePreventions(risque.Id).size()>0);
        
        //test impact risque detecte
        Impact_Risque_Entite__c impactRD=new Impact_Risque_Entite__c();
        impactRD.risque_Entite__c=risqueEntite.Id;
        impactRD.ImpactRisque__c=impactRisque.Id;
        ImpactRisqueEntiteController.add(impactRD);
        System.assert(impactRD.Id!=null);
        System.assert(ImpactRisqueEntiteController.findAll(risqueEntite.Id).size()>0);
        System.assert(ImpactRisqueEntiteController.getImpacts(risque.Id).size()>0);
        
        //test cause risque
        CauseRisqueDetecte__c causeRD=new CauseRisqueDetecte__c();
        causeRD.Name='Cause RD';
        causeRD.risqueEntite__c=risqueEntite.Id;
        CauseRisqueDetecteController.add(causeRD);
        System.assert(causeRD.Id!=null);
        System.assert(CauseRisqueDetecteController.findAll(risqueEntite.Id).size()>0);
        //test Entite affecte
        Entite_Affectee__c entiteAffectee=new Entite_Affectee__c();
       	entiteAffectee.Entite__c=entite.Id;
        entiteAffectee.risque_Entite__c=risqueEntite.Id;
        EntiteAffecteeController.add(entiteAffectee);
        System.assert(entiteAffectee.Id!=null);
        System.assert(EntiteAffecteeController.findAll(risqueEntite.Id).size()>0);
        System.assert(EntiteAffecteeController.getEntites().size()>0);
        
       //test plan action
        Plan_Action__c planAction=new Plan_Action__c();
        planAction.Name='Plan action de test';
        planAction.echeancier__c=System.today();
        planAction.date_commencement__c=System.today();
        planAction.risque_Entite__c=risqueEntite.Id;
        planAction.date_commencement__c=System.today();
        planAction.gestionnaire__c=userEntite.Id;
        PlanActionController.add(planAction);
        
        System.assert(planAction.Id!=null);
        System.assert(PlanActionController.findAllByRisqueEntite(risqueEntite.Id).size()>0 );
        System.assert(PlanActionController.findAll().size()>0 );
        System.assert(PlanActionController.findUserEntites(entite.Id).size()>0);
        System.assert(PlanActionController.getElementById(planAction.Id)!=null);
        //tes activite
        Activite__c activite=new Activite__c();
        activite.date__c=System.today();
        activite.delai__c=system.today();
        activite.Name='Activite de Test';
        activite.responsable__c=userEntite.Id;
        activite.plan_Action__c=planAction.Id;
        System.assert(ActiviteController.add(activite).Id!=null);
        System.assert(ActiviteController.findAllByPlanAction(planAction.Id).size()>0);
        System.assert(ActiviteController.findAll().size()>0);
        System.assert(ActiviteController.findUserEntites(entite.Id).size()>0);
        System.assert(ActiviteController.getElementById(activite.Id)!=null);
        //test indicateur activite
        Indicateur_Activite__c indicateurActivite=new Indicateur_Activite__c();
        indicateurActivite.activite__c=activite.Id;
        indicateurActivite.Name='Indicateur activite';
        System.assert(IndicateurActiviteController.add(indicateurActivite).Id!=null);
        System.assert(IndicateurActiviteController.findAll(activite.Id).size()>0);
        //test mesure activite
        Mesure__c mesure=new Mesure__c();
        mesure.activite__c=activite.Id;
        mesure.Name='Mesure Activite';
        System.assert(MesureController.add(mesure).Id!=null);
        System.assert(MesureController.findAll(activite.Id).size()>0);
        
        
        
        
        
        
        
        
        
        
        
        //test param risque entite
        ParamRisqueEntite__c paramRisqueEntite=new ParamRisqueEntite__c();
        paramRisqueEntite.entite__c=entite.Id;
        paramRisqueEntite.seuilApparution__c=100;
        paramRisqueEntite.unite__c='CFA';
        paramRisqueEntite.risque__c=risque.Id;
        ParamRisqueEntiteController.add(paramRisqueEntite);
        System.assert(paramRisqueEntite.Id!=null);
        System.assert(ParamRisqueEntiteController.findFromEntite(entite.Id).size()>0);
        System.assert(ParamRisqueEntiteController.getRisques(entite.Id).size()>0);
        System.assert(RisqueEntiteController.getParamRisqueEntite(paramRisqueEntite.Id)!=null);
        //test pre tarcker
        PREtracker__c pretracker=new PREtracker__c();
        pretracker.ParamRisqueEntite__c=paramRisqueEntite.Id;
        pretracker.valeur__c=10;
        pretracker.description__c='Param risque entite tracker';
        PREtrackerController.add(pretracker);
        System.assert(pretracker.Id!=null);
        System.assert(PREtrackerController.findFromParamRisqueEntite(paramRisqueEntite.Id).size()>0);
       
        
        
        
        
        
        
        
        
        //supprimer mesure activite
        System.assert(MesureController.remove(mesure)!=null);
        
        //supprimer indicateur activite
        System.assert(IndicateurActiviteController.remove(indicateurActivite)!=null);
        //supprimer activite
        System.assert(ActiviteController.remove(activite)!=null);
        //supprimer plan action
        System.assert(PlanActionController.remove(planAction)!=null);
        //supprimer entite affectee
        System.assert(EntiteAffecteeController.remove(entiteAffectee)!=null);
        //supprimer cause risque detecte
        System.assert(CauseRisqueDetecteController.remove(causeRD)!=null);
        
        //supprimer Mesure prevention risque detecte
        System.assert(MesurePreventionRisqueDetecteController.remove(mesurePreventionRD)!=null);
        //supprimer Pretracker
         System.assert(PREtrackerController.remove(pretracker)!=null);
        //supprimer param risque entite
        System.assert(ParamRisqueEntiteController.remove(paramRisqueEntite)!=null);
        
        
        //supprimer all mesure prevention risque detecté;
        List<Mesure_Prevention_Risque_Detecte__c> mesurePreventionRDs=[select Id from Mesure_Prevention_Risque_Detecte__c where risque_Detecte__c=:risqueEntite.Id];
        for(Mesure_Prevention_Risque_Detecte__c mesurePreventionRDi:mesurePreventionRDs){
        System.assert(MesurePreventionRisqueDetecteController.remove(mesurePreventionRDi)!=null);            
        }
        //supprimer IMpact Risque detecte
        List<Impact_Risque_Entite__c> impactRDs=[select Id from Impact_Risque_Entite__c where risque_Entite__c=:risqueEntite.Id];
        for(Impact_Risque_Entite__c impactRDi:impactRDs){
        System.assert(ImpactRisqueEntiteController.remove(impactRDi)!=null);            
        }
        
        
        //supprimer risque entite
        System.assert(RisqueEntiteController.remove(risqueEntite)!=null);
        
        //supprimer mesure de prevention
        System.assert(MesurePreventionController.remove(mesurePreventionRisque)!=null);
        //supprimer Impact Risque
        System.assert(ImpactRisqueController.remove(impactRisque)!=null);
        //supprimer categorieMesurePresentation
        System.assert(CategorieMesurePreventionController.remove(categorieMesurePrevention)!=null);
        //supprimer Categorie Impact
        System.assert(CategorieImpactController.remove(categorieImpact)!=null);
        //supprimer risque
        System.assert(RisqueController.remove(risque)!=null);
        //supprimer categorie risque
        System.assert(CategorieRisqueController.remove(categorieRisque)!=null);
        
        
        
        Test.stopTest();*/
    }
}