<aura:application extends="force:slds" implements="c:breadcumInterface,force:appHostable" controller="AppController">
    <ltng:require styles="/resource/bootstrapsf1/bootstrap-sf1/dist/css/bootstrap.css,
                          /resource/bootstrap/bootstrap/dist/css/bootstrap.css,
                           /resource/bootstrapsf1/bootstrap-sf1/dist/css/docs.css ,
                           /resource/lds/assets/styles/salesforce-lightning-design-system.css,
                         /resource/tabcss/tabcss.css,
                         https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css,
                         /resource/tabcssjs/css/style.css,
                          /resource/fontawesome/font-awesome-4.7.0/css/font-awesome.min.css ,
                          /resource/form/form.css" scripts='/resource/mdBoutstrap/js/jquery-2.2.3.min.js,
                           /resource/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.js,
                           /resource/form/form.js' />
                           <aura:attribute name="user" type="User"  />
                           <aura:attribute name="profile" type="Profile" description="" />
                           
                           <aura:handler action="{!c.doInit}" name="init" value="{!this}" />
                           
                           
    <article class="slds-card header" style="background:#fff ;">


        <div class=" slds-grid  slds-wrap ">
            <div class=" slds-size--1-of-4   slds-p-horizontal--small left-header ">
                <a href="#" class="fa"> <i class="fa fa-home fa-2x" style="color:#000"></i> </a>
                <a href="#" class="fa" > <i class="fa fa-cog fa-2x" style="color:#000"></i> </a>
                <a href="#" class="fa"> <i class="fa fa-user fa-2x" style="color:#000"></i> </a>
                <a href="#" class="fa"> <i class="fa fa-line-chart fa-2x" style="color:#000"></i> </a>
            </div>
            <div class=" slds-size--2-of-4   slds-p-horizontal--small " style="padding-top:10px;margin-bottom:10px;">
                <div class="slds-media__figure">
                    <span class="slds-icon_container slds-icon-standard-contact" title="description of icon when needed" style="padding:2px;color:#fff;margin-top:5px;">
          				<i class="fa fa-thermometer-half" aria-hidden="true"></i> Organisation Risk Manager
        			</span>
                </div>
            </div>
            <div class=" slds-size--1-of-4   slds-p-horizontal--small ">
                <div class="slds-media__figure" style="float :right;">
                    <a href="#" class=""><img src="/resource/profile" class="avatar" /> <span style="font-weight:bold">{!v.user.FirstName}&nbsp;{!v.user.LastName}</span></a>
                </div>
            </div>
        </div>


        <div class="header md-accent-bg p-24 pb-0 slds-grid  slds-wrap " fxlayout="column" fxlayoutalign="space-between">

            <div style="box-sizing: border-box; max-height: 100%; display: flex; flex-direction: row; place-content: flex-start space-between; align-items: flex-start;">

                <span class="mat-display-1 mb-0">Welcome  {!v.user.FirstName} {!v.user.LastName}</span>


            </div>



        </div>




    </article>
    <div style="background:#fff ;padding-top:15px">



<!-- liste des composants à mettre en form -->
<!-- <c:RisqueShowCmp Id="a0B9E000001DryJUAS" /> -->
<!-- <c:entiteshowcmp Id="a0A9E000001cQvzUAE" /> -->
<!-- <c:risqueentiteshowcmp Id="a0H9E000002K9jKUAS" /> -->
<!-- <c:ProcessusShowCmp Id="a059E000003djFaQAI" /> -->
<!-- <c:PlanActionShowCmp Id="a0O9E0000012lRCUAY" />  -->
<!-- <c:activiteshowcmp Id="a0P9E000001d6c9UAA" /> -->
<!-- <c:partieconcerneeshowcmp Id="a079E000002lokCQAQ" /> -->

<!-- <c:ProcessusListCmp /> -->



        <!--  <c:RisqueListCmp /> -->
            
    <!--   <c:CategorieRisqueListCmp /> -->
    <!--         <c:CategorieMesurePreventionListCmp /> -->
    <!--         <c:CategorieImpactListCmp /> -->
    <!--        <c:ImpactRisqueListCmp risque="a0B0E000000MH8TUAW" /> -->
    <!-- <c:MesurePreventionListCmp risque="a0B0E000000MH8TUAW" />  -->
    <!-- <c:EntiteListCmp /> -->
     <!--<c:EntiteShowCmp Id="a0A9E000001cQvzUAE" /> -->
    <!-- <c:RisqueEntiteListCmp  entite="a0A0E000000FwCpUAK" /> -->
    <!-- <c:RisqueEntiteShowCmp Id="a0H9E000002K9jKUAS" /> -->
    <!-- <c:ActiviteListCmp planAction="a0O9E0000012lRCUAY" entite="a0A9E000001cQvzUAE" /> -->
    <!--<c:MesureActiviteListCmp activite="a0P9E000001d6c9UAA" /> -->
    <!--<c:IndicateurActiviteListCmp activite="a0P9E000001d6c9UAA" /> -->
    <!--     <c:HomepageCmp /> -->
    <!-- <c:mainComponent />  -->
     
        <c:ormTabComponent />
    <!--    <c:ProcessusListCmp entite="a0A9E000001cQvzUAE"/>  -->
    <!-- <c:ActiviteShowCmp Id="a0P9E000001d6c9UAA" /> -->
    <!--     <c:UserEntiteListCmp entite="a0A0E000000FwCpUAK" /> -->
    <!--        <c:testDriss /> -->
    <!--  <c:MesurePreventionListCmp risque="a0B9E000001DrzwUAC"  /> -->
    <!--  <c:ImpactRisqueListCmp risque="a0B9E000001DrzwUAC" /> -->
        
        <!--test for driss -->
       
        <!--end test for driss -->
        
</div>

    <article class="slds-card">
         <div class=" slds-grid  slds-wrap ">
            
        <div class=" slds-size--2-of-4   slds-p-horizontal--small " style="padding-top:10px;margin-bottom:10px;">
                <div class="slds-media__figure">
                    <span class="slds-icon_container slds-icon-standard-contact" title="description of icon when needed" style="padding:5px;color:#fff;margin-top:5px;margin-bottom:5px">
          				<i class="fa fa-thermometer-half " aria-hidden="true"></i> Organisation Risk Manager
        			</span>
                </div>
            </div>
             <div class=" slds-size--2-of-4   slds-p-horizontal--small " style="padding-top:10px;margin-bottom:10px;">
                <div class="slds-media__figure">
                    <span class="" title="description of icon when needed" style="padding:2px;color:#000;margin-top:5px; float:right;padding-bottom:5px">
          				 © Tous droits réservés
        			</span>
                </div>
            </div>
             </div>
       
    </article>
</aura:application>