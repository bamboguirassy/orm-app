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
    
}