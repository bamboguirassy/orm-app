/**
 * @author: Dibocor
 * @date: Creation: 30/05/2018
 * @description: class de teste de CategorieRisqueController
 */
@isTest
public  class CategorieRisqueController_Test {	
    @testSetup
    static void setup()
    {
		Orm_TestFactory.generateCategorieRisque();
    }
}