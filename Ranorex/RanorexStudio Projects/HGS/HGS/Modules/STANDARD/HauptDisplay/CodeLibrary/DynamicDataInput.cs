/*
 * Created by Ranorex
 * User: RanorexAdmin
 * Date: 16.08.2024
 * Time: 13:35
 * 
 * To change this template use Tools > Options > Coding > Edit standard headers.
 */
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;

using WinForms = System.Windows.Forms;
using System.Xml;
using Ranorex;
using Ranorex.Core;
using Ranorex.Core.Testing;

namespace Cottbus_3000CR.Modules.CodeLibrary
{
    /// <summary>
    /// Description of UserCodeModule1.
    /// </summary>
    [TestModule("3E67AA99-9192-4F4A-B08E-B5F81ED9CEC6", ModuleType.UserCode, 1)]
    public class DynamicDataInput : ITestModule
    {
    	
    	[TestVariable("D56E1A9A-1234-4B8A-8CFA-9F656A21E2A1")]
    	public string globalparameter{ get; set; }
    	
    	
    	
    	
    	[TestVariable("23a9ce00-0e16-4ac7-8265-10dd085c2d00")]
    	public string localparameter{ get; set; }
   
    	
    	/// <summary>
        /// Constructs a new instance.
        /// </summary>
        public DynamicDataInput()
        {
            // Do not delete - a parameterless constructor is required!
        }

        /// <summary>
        /// Performs the playback of actions in this module.
        /// </summary>
        /// <remarks>You should not call this method directly, instead pass the module
        /// instance to the <see cref="TestModuleRunner.Run(ITestModule)"/> method
        /// that will in turn invoke this method.</remarks>
        void ITestModule.Run()
        {
            Mouse.DefaultMoveTime = 300;
            Keyboard.DefaultKeyPressTime = 100;
            Delay.SpeedFactor = 1.0;
            
            string[] glbtagListe = this.globalparameter.Split(';');
            string[] loctagListe = this.localparameter.Split(';');
            
             //get some Data from PRoduct
            string ProjectName=TestSuite.Current.Parameters["ProjectName"]; 
            string HGSmeldungsPfad = TestSuite.Current.Parameters["HGSmeldungsPfad"];       
            string xmlFilePath = HGSmeldungsPfad+"\\TRANSFER\\transfer_"+ProjectName+".xml";

            
            

			Report.Info("path: " + xmlFilePath);
	        try
	        {
	        	 // Laden der XML-Datei
                XmlDocument xmlDoc = new XmlDocument();
	            xmlDoc.Load(xmlFilePath);
	
	            if (this.localparameter.TrimEnd().Length>0){
		        	foreach ( string suchTag in loctagListe )
		        	{
	
			        	// Extrahieren der Werte
			            XmlNode suchNode = xmlDoc.SelectSingleNode("//"+suchTag);
			        	
			        	if (suchNode != null)
			            {
			        		string suchErgebnis = suchNode.InnerText;
		            		Report.Info(suchTag+": " + suchErgebnis+" => Lokale Variable");
		            		TestSuite.CurrentTestContainer.Parameters[suchTag] = suchErgebnis;	            		
			        	}	        		        	
		        	}
	            }
	        	foreach ( string suchTag in glbtagListe )
	        	{
		        	// Extrahieren der Werte
		            XmlNode suchNode = xmlDoc.SelectSingleNode("//"+suchTag);
		        	
		        	if (suchNode != null)
		            {
		        		string suchErgebnis = suchNode.InnerText;
	            		Report.Info(suchTag+": " + suchErgebnis+" => Globale Variable");
	            		TestSuite.Current.Parameters[suchTag] = suchErgebnis;	            		
		        	}	        		        	
	        	}	  
	        	
	        }catch(XmlException ex){
	        	
		        Report.Error("Fehler beim Verarbeiten der XML-Datei: " + ex.Message);
	            Validate.Fail("Es gab einen Fehler bei der Verarbeitung der XML-Datei: " + ex.Message);        		
	            
	        }catch(Exception ex){	     

		        Report.Error("Fehler beim Verarbeiten: " + ex.Message);
	            Validate.Fail("Es gab einen Fehler bei der Verarbeitung: " + ex.Message);        		        	
	            
	        }

        }
        

    }
}
