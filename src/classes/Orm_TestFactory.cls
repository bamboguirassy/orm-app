/**
 * @author: David
 * @date: 25/05/2018
 * @description: generer les données de test
 */
public class Orm_TestFactory 
{

  /**
   * @author : David
   * @date : 25/05/2018
   * @description :generer une liste de categorie risque
   */
    public static List<Categorie_Risque__c> generateCategorieRisque()
    {
        List<Categorie_Risque__c> categories=new List<Categorie_Risque__c>();
        for(Integer i=0;i<20; i++)
        {
            categories.add(new Categorie_Risque__c(Name='categorie'+ i,Description__c='description'));
        } 
        insert categories;
        return categories;
    }

    /**
     * @author : David
     * @date  :25/05/2018
     * @description : generer une liste de risque
     */
    public static List<Risque__c> generateRisque(List<Categorie_Risque__c> categories)
    {
        LIST<Risque__c> risques =new LIST<Risque__c>();
        for(Categorie_Risque__c categorie:categories)
        {
            risques.add(new Risque__c(Name='risque'+categorie.Id,description__c='description',categorieRisque__c=categorie.id));
        }
        insert risques;
        return risques;
    }
    
    /**
     * @author : David
     * @date  :25/05/2018
     * @description : generer une liste de categorie impact
     */
    public static List<CategorieImpact__c> generateCategorieImpact()
    {
        List <CategorieImpact__c> categorieImpacts =new List<CategorieImpact__c>();
        for(Integer i=0;i<20; i++)
        {
            categorieImpacts.add(new CategorieImpact__c(Name='categorieImpact'+ i,Description__c='description'));
        } 
        insert categorieImpacts;
        return categorieImpacts; 
    }

    /**
     * @author : David
     * @date : 25/05/5018
     * @description : generer une liste de categorie de mesure de prevention
     */    
    public static LIST<Categorie_Mesure_Prevention__c> generateCategorieMesurePrevention()
    {
        List<Categorie_Mesure_Prevention__c> categorieMesurePreventions= new List<Categorie_Mesure_Prevention__c>();
        for(Integer i=0;i<20; i++)
        {
            categorieMesurePreventions.add(new Categorie_Mesure_Prevention__c(Name='categorieMesurePrevention'+ i,Description__c='description'));
        } 
        insert categorieMesurePreventions;
        return categorieMesurePreventions; 

    }
   
   /**
   * @date : 28/05/2018
   * @description :generer une liste de structure (Account)
   */
    public static List<Account> generateStructure()
    {
        List<Account> structure=new List<Account>();
        for(Integer i=0;i<20; i++)
        {
            structure.add(new Account(Name='entite'+ i,Phone='777'));

        } 
        insert structure;
        return structure;
    }   
    /**
     * @author : laye
     * @date : 31/05/2018
     * @description :generer une liste de responsable (contact)
     */
    public static List<Contact> generateRiskManager(string entiteId){
        List<Contact> responsables = new List<Contact>();
        for(integer i= 0; i< 20; i++)
        {
            responsables.add(new Contact(Email='email@gmail.com', LastName='lastName-'+i, AccountId=entiteId));
        } 
        insert responsables;
        return responsables;
    }
   
    /**
   * @author : salimata
   * @date : 28/05/2018
   * @description :generer une liste de responsable (contact)
   */
    public static List<Contact> generateContact()
    {
    	   List<Account> entites=generateStructure();
       
        List<Contact> responsable=new List<Contact>();
         for(Account entite:entites)
        {
            responsable.add(new Contact(FirstName='name1',LastName='lastName1',Birthdate=System.today(),Phone='7777',Email='email@gmail.com',AccountId=entite.Id));
        } 
        insert responsable;
        return responsable;
    }
  
   /**
   * @author : salimata
   * @date : 28/05/2018
   * @description :generer une liste de risque entite
   */
    public static List<Risque_Entite__c> generateRisqueDetecte(string idRisque, string idResponsable, string idEntite)
    {    	
        List<Risque_Entite__c> risqueEntite=new List<Risque_Entite__c>();
        for(Integer i=0;i<20; i++)
        {
          risqueEntite.add(new Risque_Entite__c(frequence__c=2,gravite__c=1,maitrise__c=2,Date_Detection__c=System.today(),
                                                risque__c=idRisque,responsable__c=idResponsable, description__c='description', entite__c= idEntite));
        } 
        insert risqueEntite;
        return risqueEntite;
    }
    
   /**
     * @author : Dibocor
     * @date  :31/05/2018
     * @description : generer une liste des ImpactRisques
     */
    public static List<Impact__c> generateImpactRisque(List<CategorieImpact__c> categorieImpacts)
    {
    	List<Categorie_Risque__c> categorierisques =generateCategorieRisque();
        List<Risque__c> risques=generateRisque(categorierisques);
        List<Impact__c> impactRisques =new List<Impact__c>();
        for(CategorieImpact__c categorieImpact: categorieImpacts)
        {
            impactRisques.add(new Impact__c(risque__c=risques[0].Id,description__c='description',Categorie_Impact__c=categorieImpact.Id));
        }
        insert impactRisques;
        return impactRisques;
    } 
    
    /**
     * @author : Laye
     * @date : 01/06/2018
     * @description : generer une liste de ParamRisqueEntite__c 
     */
    public static List<ParamRisqueEntite__c> generateParamRisqueEntite(string idEntite, string idRisque){
        List<ParamRisqueEntite__c> paramRisqueEntites = new List<ParamRisqueEntite__c>();
        for(integer i = 0; i < 20; i++){
            paramRisqueEntites.add(new ParamRisqueEntite__c(unite__c = 'unite-'+ i, seuilApparution__c = i, risque__c=idRisque, entite__c = idEntite));
        }
        insert paramRisqueEntites;
        return paramRisqueEntites;
    }
    /**
     * @author : David 
     * @date : 01/06/2018
     * @description : generer une liste de Projet
     */
    public static List<Projet__c> generateProjet(string idEntite,string idResponsable){
         List<Projet__c> projets= new List<Projet__c>();
         for(integer i = 0; i < 20; i++){
            projets.add(new Projet__c(Cout__c = 25,Description__c = 'description',Name = 'nom'+i , Site_Web_du_projet__c = 'site@site.com',
                                      Date_fin_prevue__c=System.today() , Date_debut__c = System.today() , Structure__c = idEntite , Responsable__c = idResponsable));
        }
        
        insert projets;
        return projets;
    }
    /**
     * @author : David 
     * @date : 04/06/2018
     * @description : generer une liste de RisqueProjet
     */
     public static List<Risque_Projet__c> generateRisqueProjet(string idPojet,string idRisqueDetecte){
     	 List<Risque_Projet__c> risqueProjets= new List<Risque_Projet__c>();
     	  for(integer i = 0; i < 20; i++){
     	risqueProjets.add(new Risque_Projet__c(Projet__c=idPojet,Risque_detecte__c=idRisqueDetecte));
     	  }
     	 upsert risqueProjets;
         return risqueProjets;
     }
    
    /**
     * @author: Laye
     * @date: Modification: 04/06/2018
     * @description: methode de test de findAllByRisqueEntite
     */
    public static List<Plan_Action__c> generatePlanActions(List<Risque_Entite__c> risqueEntites, string idRiskManager){
    	List<Plan_Action__c> actionPlans = new List<Plan_Action__c>();
        for(Risque_Entite__c risqueEntite : risqueEntites){
            for(integer i = 0; i < 20; i++){
    			actionPlans.add(new Plan_Action__c(Name='plan action-'+ i, etat__c= false, date_commencement__c = System.now(), 
    			echeancier__c = System.now().addDays(4), risque_Entite__c = risqueEntite.Id, gestionnaire__c = idRiskManager, 
                RecordTypeId=PlanActionController.getPlanActionCorrectifRecordTypeId()));
    		}
        }    	
    	insert actionPlans;
    	return actionPlans;
    }     
   
     /**
     * @author : David 
     * @date : 04/06/2018
     * @description : generer une liste de IntervenantProjet
     */
     public static List<IntervenantProjet__c> generateIntervenantProjet(string idProjet,string idIntervenant ){
     	 List<IntervenantProjet__c> intervenantProjets= new List<IntervenantProjet__c>();
     	  for(integer i = 0; i < 20; i++){
     	intervenantProjets.add(new IntervenantProjet__c(Role__c='role 1'+i ,Project__c=idProjet,Intervenant__c=idIntervenant));
     	  }
     	 upsert intervenantProjets;
         return intervenantProjets;
     }
   	  /**
     * @author : David 
     * @date : 04/06/2018
     * @description : generer une liste de CauseRisqueDetecte
     */
     public static List<CauseRisqueDetecte__c> generateCauseRisqueDetecte(string idRisqueEntite ){
     	 List<CauseRisqueDetecte__c>  CauseRisqueDetecte= new List<CauseRisqueDetecte__c>();
     	  for(integer i = 0; i < 20; i++){
     	CauseRisqueDetecte.add(new CauseRisqueDetecte__c(Name='name'+i,Description__c='description'+i,risqueEntite__c=idRisqueEntite));
     	  }
     	 upsert CauseRisqueDetecte;
         return CauseRisqueDetecte;
     }
     
     /**
     * @author : David 
     * @date : 04/06/2018
     * @description : generer une liste de entiteAffectee
     */
     public static List<Entite_Affectee__c> generateEntiteAffectee(string idRisqueEntite,string idEntite ){
     	 List<Entite_Affectee__c>  entiteAffectees= new List<Entite_Affectee__c>();
     	  for(integer i = 0; i < 20; i++){
     	entiteAffectees.add(new Entite_Affectee__c(risque_Entite__c=idRisqueEntite,Entite__c=idEntite));
     	  }
     	 upsert entiteAffectees;
         return entiteAffectees;
     }
     
     /**
     * @author : Laye 
     * @date : 05/06/2018
     * @description : generer une liste dindicateur
     */
    public static List<Activite__c> generateActivites(Plan_Action__c actionPlan){
        List<Activite__c> activites = new List<Activite__c>();
        Datetime now = System.now();
        for(integer i = 0; i < 20; i++){
            activites.add(new Activite__c(Name= 'Name-'+i, type__c= 'Corrective', date__c= now.addDays(1) , delai__c= now.addDays(2), 
                                          responsable__c=actionPlan.gestionnaire__c, plan_Action__c= actionPlan.Id));
        }
        insert activites;
        return activites;
    }
    
    /**
     * @author : Laye 
     * @date : 05/06/2018
     * @description : generer une liste dindicateur
     */
    public static List<Indicateur_Activite__c> genererIndicateurActivites(Activite__c activite){
        List<Indicateur_Activite__c> indicateurActivites = new List<Indicateur_Activite__c>();
        for(integer i=0; i< 20; i++){
            indicateurActivites.add(new Indicateur_Activite__c(Name= 'Name', description__c= 'description', activite__c= activite.Id));
        }
        insert indicateurActivites;
        return indicateurActivites;
    }
    
    /**
     * @author : Laye 
     * @date : Creation: 06/06/2018
     * @description : generer une liste de mesure
     */
    public static List<Mesure__c> generateMesureActivites(Activite__c activite){
        List<Mesure__c> mesures = new List<Mesure__c>();
        for(integer i=0; i< 20; i++){
            mesures.add(new Mesure__c(Name= 'Name', description__c= 'description', activite__c= activite.Id));
        }
        insert mesures;
        return mesures;
    }
    
    /**
     * @author : Laye 
     * @date : Creation: 06/06/2018
     * @description : generer une liste d'evidences
     */
    public static List<Evidence__c> generateEvidences(Mesure__c mesure){
        List<Evidence__c> evidences = new List<Evidence__c>();
        for(integer i=0; i< 20; i++){
            evidences.add(new Evidence__c(Name= 'Name', description__c= 'description', evidenceOfActivity__c= mesure.Id));
        }
        insert evidences;
        return evidences;
    }
    
     /**
     * @author : David 
     * @date : 05/06/2018
     * @description : generer une liste de Processus
     */
     public static List<Processus__c> generateProcessus(string idPilote,string idCopilote,string idEntite ){
     	 List<Processus__c>  processus= new List<Processus__c>();
     	  for(integer i = 0; i < 20; i++){
     	processus.add(new Processus__c(copilote__c=idCopilote,proprietaire__c=idEntite,pilote__c=idPilote,
     												version__c='5',Name='processus'+i,reference__c='reference',finalite__c='finalite',
     												dateApplication__c=System.today()));
     	  }
     	 upsert processus;
         return processus;
     }
     
      /**
     * @author : David 
     * @date : 05/06/2018
     * @description : generer une liste de ProcessusRisque
     */
     public static List<ProcessusRisque__c> generateProcessusRisque(string idProcessus,string risqueEntite){
     	 List<ProcessusRisque__c>  processusRisques= new List<ProcessusRisque__c>();
     	  for(integer i = 0; i < 20; i++){
     	processusRisques.add(new ProcessusRisque__c(processus__c=idProcessus,risqueEntite__c=risqueEntite));
     	  }
     	 upsert processusRisques;
         return processusRisques;
     }
     /**
     * @author : David 
     * @date : 05/06/2018
     * @description : generer une liste de PartieConcernee
     */
     public static List<PartieConcernee__c> generatePartieConcernee(string idProcessus){
     	 List<PartieConcernee__c>  partieConcernees= new List<PartieConcernee__c>();
     	  for(integer i = 0; i < 20; i++){
     	partieConcernees.add(new PartieConcernee__c(processus__c=idProcessus,Name='name'+i));
     	  }
     	 upsert partieConcernees;
         return partieConcernees;
     }

      /**
     * @author : David 
     * @date : 05/06/2018
     * @description : generer une liste de ProcessusEntree
     */
     public static List<ProcessusEntree__c> generateProcessusEntree(string idProcessus,string idSource){
     	 List<ProcessusEntree__c>  processusEntrees= new List<ProcessusEntree__c>();
     	  for(integer i = 0; i < 20; i++){
     	processusEntrees.add(new ProcessusEntree__c(processus__c=idProcessus,source__c=idSource));
     	  }
     	 upsert processusEntrees;
         return processusEntrees;
     }
    
     /**
     * @author : David 
     * @date : 05/06/2018
     * @description : generer une liste de EntiteSource
     */
     public static List<EntiteSource__c> generateEntiteSource(string idProcessus,string idEntite){
     	 List<EntiteSource__c>  entiteSources= new List<EntiteSource__c>();
     	  for(integer i = 0; i < 20; i++){
     	   entiteSources.add(new EntiteSource__c(processus__c=idProcessus,entite__c=idEntite));
     	  }
     	 upsert entiteSources;
         return entiteSources;
     }
     /**
     * @author : David 
     * @date : 05/06/2018
     * @description : generer une liste de ElementEntree
     */
     public static List<ElementEntree__c> generateElementEntree(string idProcessus){
     	 List<ElementEntree__c>  elementEntrees= new List<ElementEntree__c>();
     	  for(integer i = 0; i < 20; i++){
     	     elementEntrees.add(new ElementEntree__c(processus__c=idProcessus,Name='name'+i));
     	  }
     	 upsert elementEntrees;
         return elementEntrees;
     }
      /**
     * @author : David 
     * @date : 05/06/2018
     * @description : generer une liste de Processus sortie
     */
     public static List<ProcessusSortie__c> generateProcessusSortie(string idProcessus,string idDestination){
     	 List<ProcessusSortie__c>  processusSorties= new List<ProcessusSortie__c>();
     	  for(integer i = 0; i < 20; i++){
     	     processusSorties.add(new ProcessusSortie__c(processus__c=idProcessus, destination__c=idDestination));
     	  }
     	 upsert processusSorties;
         return processusSorties;
     }
      /**
     * @author : David 
     * @date : 05/06/2018
     * @description : generer une liste de Entite sortie
     */
     public static List<EntiteSortie__c> generateEntiteSortie(string idProcessus,string idEntite){
     	 List<EntiteSortie__c>  entiteSorties= new List<EntiteSortie__c>();
     	  for(integer i = 0; i < 20; i++){
     	     entiteSorties.add(new EntiteSortie__c(processus__c=idProcessus, entite__c=idEntite));
     	  }
     	 upsert entiteSorties;
         return entiteSorties;
     }
     /**
     * @author : David 
     * @date : 05/06/2018
     * @description : generer une liste de Element sortie
     */
     public static List<ElementSortie__c> generateElementSortie(string idProcessus){
     	 List<ElementSortie__c>  elementSorties= new List<ElementSortie__c>();
     	  for(integer i = 0; i < 20; i++){
     	     elementSorties.add(new ElementSortie__c(processus__c=idProcessus));
     	  }
     	 upsert elementSorties;
         return elementSorties;
     }
     /**
     * @author : David 
     * @date : 06/06/2018
     * @description : generer une liste de PartieInteressee
     */
     public static List<PartieInteressee__c> generatePartieIntereesee(string idPartieConcernee){
     	 List<PartieInteressee__c>  partieInteressees= new List<PartieInteressee__c>();
     	  for(integer i = 0; i < 20; i++){
     	partieInteressees.add(new PartieInteressee__c(PartieConcernee__c=idPartieConcernee,Name='name'+i));
     	  }
     	 upsert partieInteressees;
         return partieInteressees;
     }
     
      /**
     * @author : David 
     * @date : 06/06/2018
     * @description : generer une liste de ImpactPC
     */
     public static List<ImpactPC__c> generateImpactPC(string idPartieConcernee){
     	 List<ImpactPC__c>  impactPCs= new List<ImpactPC__c>();
     	  for(integer i = 0; i < 20; i++){
     	impactPCs.add(new ImpactPC__c(PartieConcernee__c=idPartieConcernee,Name='name'+i));
     	  }
     	 upsert impactPCs;
         return impactPCs;
     }
     /**
     * @author : David 
     * @date : 06/06/2018
     * @description : generer une liste de ModeSurveillancePC
     */
     public static List<ModeSurveillancePC__c> generateModeSurveillancePC(string idPartieConcernee){
     	 List<ModeSurveillancePC__c>  modeSurveillancePCs= new List<ModeSurveillancePC__c>();
     	  for(integer i = 0; i < 20; i++){
     	modeSurveillancePCs.add(new ModeSurveillancePC__c(PartieConcernee__c=idPartieConcernee,Name='name'+i));
     	  }
     	 upsert modeSurveillancePCs;
         return modeSurveillancePCs;
     }
     
      /**
     * @author : David 
     * @date : 06/06/2018
     * @description : generer une liste de RevuePC
     */
     public static List<RevuePC__c> generateRevuePC(string idPartieConcernee){
     	 List<RevuePC__c>  revuePCs= new List<RevuePC__c>();
     	  for(integer i = 0; i < 20; i++){
     	revuePCs.add(new RevuePC__c(PartieConcernee__c=idPartieConcernee,Name='name'+i));
     	  }
     	 upsert revuePCs;
         return revuePCs;
     }
     /**
     * @author : David 
     * @date : 06/06/2018
     * @description : generer une liste de ExigencePC
     */
     public static List<ExigencePC__c> generateExigencePC(string idPartieConcernee){
     	 List<ExigencePC__c>  exigencePCs= new List<ExigencePC__c>();
     	  for(integer i = 0; i < 20; i++){
     	exigencePCs.add(new ExigencePC__c(PartieConcernee__c=idPartieConcernee,Name='name'+i));
     	  }
     	 upsert exigencePCs;
         return exigencePCs;
     }
      /**
     * @author : David 
     * @date : 06/06/2018
     * @description : generer une liste de CritereEfficacitePC
     */
     public static List<CritereEfficacitePC__c> generateCritereEfficacitePC(string idPartieConcernee){
     	 List<CritereEfficacitePC__c>  critereEfficacitePCs= new List<CritereEfficacitePC__c>();
     	  for(integer i = 0; i < 20; i++){
     	critereEfficacitePCs.add(new CritereEfficacitePC__c(PartieConcernee__c=idPartieConcernee,Name='name'+i));
     	  }
     	 upsert critereEfficacitePCs;
         return critereEfficacitePCs;
     }
       /**
     * @author : David 
     * @date : 06/06/2018
     * @description : generer une liste de Mesure Prevention
     */
     public static List<Mesure_Prevention__c> generateMesurePrevention(string idCategorieMesurePrevention,string idRisque){
     	 List<Mesure_Prevention__c>  mesurePreventions= new List<Mesure_Prevention__c>();
     	  for(integer i = 0; i < 20; i++){
     	mesurePreventions.add(new Mesure_Prevention__c(CategorieMesurePrevention__c=idCategorieMesurePrevention,Description__c='name'+i,Risque__c=idRisque));
     	  }
     	 upsert mesurePreventions;
         return mesurePreventions;
     }
       /**
     * @author : David 
     * @date : 06/06/2018
     * @description : generer une liste de Impact Risque
     */
     public static List<Impact__c> generateImpact(string idcategorieImpact,string idRisque){
     	 List<Impact__c>  impacts= new List<Impact__c>();
     	  for(integer i = 0; i < 20; i++){
     	 impacts.add(new Impact__c(Categorie_Impact__c=idcategorieImpact,description__c='name'+i,risque__c=idRisque));
     	  }
     	 upsert impacts;
         return impacts;
     }
     /**
     * @author : David
     * @date : 06/06/2018
     * @description : generer une liste de PREtracker 
     */
    public static List<PREtracker__c> generatePREtracker(string idParamRisqueEntite){
        List<PREtracker__c> PREtrackers = new List<PREtracker__c>();
        for(integer i = 0; i < 20; i++){
            PREtrackers.add(new PREtracker__c(description__c='description',Name='name'+i,valeur__c=i,ParamRisqueEntite__c=idParamRisqueEntite));
        }
        insert PREtrackers;
        return PREtrackers;
    }

     /**
     * @author : David
     * @date : 06/06/2018
     * @description : generer une liste de Mesure Prevention Risque Detecte 
     */
    public static List<Mesure_Prevention_Risque_Detecte__c> generateMesurePreventionRisqueDetecte(string idParamRisqueEntite,string IdMesurePrevention){

        List<Mesure_Prevention_Risque_Detecte__c> mesurePreventionRisqueDetectes = new List<Mesure_Prevention_Risque_Detecte__c>();
        for(integer i = 0; i < 20; i++){
            mesurePreventionRisqueDetectes.add(new Mesure_Prevention_Risque_Detecte__c(risk_tracking_parameter__c=idParamRisqueEntite,mesure_Prevention__c=idMesurePrevention));
        }
        insert mesurePreventionRisqueDetectes;
        return mesurePreventionRisqueDetectes;
    }
    
     /**
     * @author: DAVID
     * @date: Modification: 06/06/2018
     * @description: methode de test de PlanActionPreventifController
     */
    public static List<Plan_Action__c> generatePlanActionActionPreventif(List<Risque_Entite__c> risqueEntites, string idRiskManager,string idparamRisque){
    	List<Plan_Action__c> actionPlans = new List<Plan_Action__c>();
        for(Risque_Entite__c risqueEntite : risqueEntites){
            for(integer i = 0; i < 20; i++){
    			actionPlans.add(new Plan_Action__c(Name='plan action-'+ i, etat__c= false, date_commencement__c = System.now(), 
    			echeancier__c = System.now().addDays(4), risque_Entite__c = risqueEntite.Id, gestionnaire__c = idRiskManager,ParamRisqueEntite__c=idparamRisque,
                RecordTypeId=PlanActionPreventifController.getPlanActionPreventifRecordTypeId()));
    		}
        }    	
    	insert actionPlans;
    	return actionPlans;
    }  
    /**
     * @author : David
     * @date : 07/06/2018
     * @description : generer une liste de Impact_Risque_Entite__c 
     */
    public static List<Impact_Risque_Entite__c> generateImpactRisqueEntite(string idRisqueEntite, string idImpactRisque){
        List<Impact_Risque_Entite__c> impactRisqueEntites = new List<Impact_Risque_Entite__c>();
        for(integer i = 0; i < 20; i++){
            impactRisqueEntites.add(new Impact_Risque_Entite__c(risque_Entite__c = idRisqueEntite,ImpactRisque__c=idImpactRisque));
        }
        insert impactRisqueEntites;
        return impactRisqueEntites;
    }   

}