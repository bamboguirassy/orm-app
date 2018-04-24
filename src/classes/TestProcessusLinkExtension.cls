@IsTest
public class TestProcessusLinkExtension {
    static testMethod void test(){
        //create an entity
        Account entite=new Account();
        entite.Name='Test1';
        Test.startTest();
        //insert entite
        insert entite;
        
        //test user entite
        Contact userEntite=new Contact();
        User user=[select Id,Name from User Limit 1];
        userEntite.FirstName='user.Id';
        userEntite.LastName='entite.Id';
        userEntite.AccountId=entite.Id;
        insert userEntite;
        
       //test de processus
        Processus__c processus=new Processus__c();
        processus.Name='Processus de test';
        processus.proprietaire__c=entite.Id;
        processus.pilote__c=userEntite.Id;
        processus.reference__c='REF 10.5';
        processus.version__c='5.1';
        processus.dateApplication__c=System.today();
        System.assert(ProcessusController.add(processus).Id!=null);
        System.assert(ProcessusController.findAll().size()>0);
        System.assert(ProcessusController.findFromEntite(entite.Id).size()>0);
        System.assert(ProcessusController.findUserEntites(entite.Id).size()>0);
        System.assert(ProcessusController.getElementById(processus.Id)!=null);
        System.assert(ProcessusController.getEntites().size()>0);
        //test categorie risque
        Categorie_Risque__c categorieRisque=new Categorie_Risque__c();
        categorieRisque.Name='Categorie de Test';
        CategorieRisqueController.add(categorieRisque);
        //test risque
        Risque__c risque=new Risque__c();
        risque.Name='Risque de test';
        risque.categorieRisque__c=categorieRisque.Id;
        
        RisqueController.add(risque);
        System.assert(risque.Id!=null);
        //test risque entite
        Risque_Entite__c risqueEntite=new Risque_Entite__c();
        risqueEntite.Risque__c=risque.Id;
        risqueEntite.Entite__c=entite.Id;
        risqueEntite.frequence__c=1;
        risqueEntite.gravite__c=2;
        risqueEntite.maitrise__c=2;
        risqueEntite.responsable__c=userEntite.Id;
        RisqueEntiteController.add(risqueEntite);
        //test de processus risque
        ProcessusRisque__c processusRisque=new ProcessusRisque__c();
        processusRisque.processus__c=processus.Id;
        processusRisque.risqueEntite__c=risqueEntite.Id;
        System.assert(ProcessusRisqueController.add(processusRisque).Id!=null);
        System.assert(ProcessusRisqueController.findFromProcessus(processus.Id).size()>0);
        System.assert(ProcessusRisqueController.getRisqueEntites(entite.Id).size()>0);
        //test partie concernee
        PartieConcernee__c partieConcernee=new PartieConcernee__c();
        partieConcernee.Name='Etudiant';
        partieConcernee.processus__c=processus.Id;
        System.assert(PartieConcerneeController.add(partieConcernee).Id!=null);
        System.assert(PartieConcerneeController.findFromProcessus(processus.Id).size()>0);
        System.assert(PartieConcerneeController.getElementById(partieConcernee.Id)!=null);
        //test processus en entree
        ProcessusEntree__c processusEntree=new ProcessusEntree__c();
        processusEntree.processus__c=processus.Id;
        processusEntree.source__c=processus.Id;
        System.assert(ProcessusEntreeController.add(processusEntree).Id!=null);
        System.assert(ProcessusEntreeController.findFromProcessus(processus.Id).size()>0);
        System.assert(ProcessusEntreeController.getProcessus(entite.Id).size()>0);
        //test entite source
        EntiteSource__c entiteSource=new EntiteSource__c();
        entiteSource.entite__c=entite.Id;
        entiteSource.processus__c=processus.Id;
        System.assert(EntiteSourceController.add(entiteSource).Id!=null);
        System.assert(EntiteSourceController.findFromProcessus(processus.Id).size()>0);
        System.assert(EntiteSourceController.getEntites().size()>0);
        //test entite source
        EntiteSortie__c entiteSortie=new EntiteSortie__c();
        entiteSortie.entite__c=entite.Id;
        entiteSortie.processus__c=processus.Id;
        System.assert(EntiteSortieController.add(entiteSortie).Id!=null);
        System.assert(EntiteSortieController.findFromProcessus(processus.Id).size()>0);
        System.assert(EntiteSortieController.getEntites().size()>0);
        //test element entree
        ElementEntree__c elementEntree=new ElementEntree__c();
        elementEntree.processus__c=processus.Id;
        elementEntree.Name='Elment 1 en entree';
        System.assert(ElementEntreeController.add(elementEntree).Id!=null);
        System.assert(ElementEntreeController.findFromProcessus(processus.Id).size()>0);
        //test element Sortie
        ElementSortie__c elementSortie=new ElementSortie__c();
        elementSortie.processus__c=processus.Id;
        elementSortie.Name='Elment 1 en sortie';
        System.assert(ElementSortieController.add(elementSortie).Id!=null);
        System.assert(ElementSortieController.findFromProcessus(processus.Id).size()>0);
        //test processus en sortie
        ProcessusSortie__c processusSortie=new ProcessusSortie__c();
        processusSortie.processus__c=processus.Id;
        processusSortie.destination__c=processus.Id;
        System.assert(ProcessusSortieController.add(processusSortie).Id!=null);
        System.assert(ProcessusSortieController.findFromProcessus(processus.Id).size()>0);
        System.assert(ProcessusSortieController.getProcessus(entite.Id).size()>0);


        //Dans partie Concernee
        //test partie interessee
        PartieInteressee__c partieInteressee=new PartieInteressee__c();
        partieInteressee.Name='Etudiant';
        partieInteressee.PartieConcernee__c=partieConcernee.Id;
        System.assert(PartieInteresseeController.add(partieInteressee)!=null);
        System.assert(PartieInteresseeController.findFromPartieConcernee(partieConcernee.Id).size()>0);
        //impact partie concernee
        ImpactPC__c impactPC=new ImpactPC__c();
        impactPC.Name='Impact PC 1';
        impactPC.PartieConcernee__c=partieConcernee.Id;
        System.assert(ImpactPCController.add(impactPC)!=null);
        System.assert(ImpactPCController.findFromPartieConcernee(partieConcernee.Id).size()>0);
        //mode surveillance partie concernee
        ModeSurveillancePC__c modeSurveillancePC=new ModeSurveillancePC__c();
        modeSurveillancePC.PartieConcernee__c=partieConcernee.Id;
        modeSurveillancePC.Name='Mode de surveillance 1 PC';
        System.assert(ModeSurveillancePCController.add(modeSurveillancePC)!=null);
        System.assert(ModeSurveillancePCController.findFromPartieConcernee(partieConcernee.Id).size()>0);
        //test des Revues Partie Concernee
        RevuePC__c revuePC=new RevuePC__c();
        revuePC.Name='Revue Partie Concernee';
        revuePC.PartieConcernee__c=partieConcernee.Id;
        RevuePCController.add(revuePC);
        System.assert(revuePC.Id!=null);
        System.assert(RevuePCController.findFromPartieConcernee(partieConcernee.Id).size()>0);
        //test exigence Partie concernee
        ExigencePC__c exigencePC=new ExigencePC__c();
        exigencePC.Name='Exigence 1 partie concernee';
        exigencePC.PartieConcernee__c=partieConcernee.Id;
        System.assert(ExigencePCController.add(exigencePC)!=null);
        System.assert(ExigencePCController.findFromPartieConcernee(partieConcernee.Id).size()>0);
        //test critere efficacite
        CritereEfficacitePC__c critereEfficacitePC=new CritereEfficacitePC__c();
        critereEfficacitePC.Name='Critere efficacité PC';
        critereEfficacitePC.PartieConcernee__c=partieConcernee.Id;
        System.assert(CritereEfficacitePCController.add(critereEfficacitePC)!=null);
        System.assert(CritereEfficacitePCController.findFromPartieConcernee(partieConcernee.Id).size()>0);
        
        
        
        
        
        
        
        
        
        
        //remove Critere Efficacité Partie Concernee
        System.assert(CritereEfficacitePCController.remove(critereEfficacitePC)!=null);
        //remove Exigence Partie Concernee
        System.assert(ExigencePCController.remove(exigencePC)!=null);
        //remove Revues Partie COncernee
        System.assert(RevuePCController.remove(revuePC)!=null);
        //remove Mode de surveillance partie concernee
        System.assert(ModeSurveillancePCController.remove(modeSurveillancePC)!=null);
        //remove impact partie concernee
        System.assert(ImpactPCController.remove(impactPC)!=null);
        //remove partie interessee
        System.assert(PartieInteresseeController.remove(partieInteressee)!=null);
        //remove element Sortie
        System.assert(ElementSortieController.remove(elementSortie)!=null);
        //remove element entree
        System.assert(ElementEntreeController.remove(elementEntree)!=null);
        //delete entite sortie
       	System.assert(EntiteSortieController.remove(entiteSortie)!=null);
        //delete entite source
        System.assert(EntiteSourceController.remove(entiteSource)!=null);
        //delete processus sortie
        System.assert(ProcessusSortieController.remove(processusSortie)!=null);
        //delete processus entree
        System.assert(ProcessusEntreeController.remove(processusEntree)!=null);
        //delete partie concernee
        System.assert(PartieConcerneeController.remove(partieConcernee)!=null);
        //delete processus risque
         System.assert(ProcessusRisqueController.remove(processusRisque)!=null);
        //delete processus
        System.assert(ProcessusController.remove(processus)!=null);
        //delete risque entite
        System.assert(RisqueEntiteController.remove(risqueEntite)!=null);
        
        Test.stopTest();
    }
}