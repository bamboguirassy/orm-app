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
            responsable.add(new Contact(Email='email@gmail.com',AccountId=entite.Id));
        } 
        insert responsable;
        return responsable;
    }
  
   /**
   * @author : salimata
   * @date : 28/05/2018
   * @description :generer une liste de risque entite
   */
    public static List<Risque_Entite__c> generateCauseRisqueDetecte()
    {	
    	List<Contact>  responsables=generateContact();
    	List<Categorie_Risque__c> categorierisques =generateCategorieRisque();
    	List<Risque__c> risques=generateRisque(categorierisques);
    	List<Account> structures=generateStructure();
        List<Risque_Entite__c> risqueentite=new List<Risque_Entite__c>();
        
        for(Integer i=0;i<20; i++)
        {
          risqueentite.add(new Risque_Entite__c(risque__c=risques[1].Id,responsable__c=responsables[1].Id,Description__c='description', entite__c=structures[1].Id));
        } 
        insert risqueentite;
        return risqueentite;
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
    
    
}