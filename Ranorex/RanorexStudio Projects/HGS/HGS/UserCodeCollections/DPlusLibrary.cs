/*
 * Created by Ranorex
 * User: gac
 * Date: 02.09.2024
 * Time: 10:11
 * 
 * To change this template use Tools > Options > Coding > Edit standard headers.
 */
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Drawing;
using System.Threading;
using WinForms = System.Windows.Forms;

using System.Xml;
using Ranorex;
using Ranorex.Core;
using Ranorex.Core.Repository;
using Ranorex.Core.Testing;

namespace Cottbus_3000CR.UserCodeCollections
{
    /// <summary>
    /// Creates a Ranorex user code collection. A collection is used to publish user code methods to the user code library.
    /// </summary>
    [UserCodeCollection]
    public class DPlusLibrary
    {
        // You can use the "Insert New User Code Method" functionality from the context menu,
        // to add a new method with the attribute [UserCodeMethod].
                /// <summary>
        /// This is a placeholder text. Please describe the purpose of the
        /// user code method here. The method is published to the user code library
        /// within a user code collection.
        /// </summary>
        [UserCodeMethod]
        public static void Fill_textfilter(RepoItemInfo inputField, string input)
        {
            Report.Log(ReportLevel.Info, "Keyboard", "Key sequence from  '"+input+"' with focus on 'inputtagInfo'.", inputField);
            
            //pruefe ob bereits gefüllt ist 
            
            if (! inputField.FindAdapter<InputTag>().Value.IsEmpty() ) {
            	Report.Log(ReportLevel.Info, "Fill_textfilter", "DoubleClick on 'inputtagInfo' for selection.", inputField);
            	inputField.FindAdapter<InputTag>().DoubleClick();
            	inputField.FindAdapter<InputTag>().PressKeys("{Delete}");
            	
            }
            Report.Log(ReportLevel.Info, "Fill_textfilter", "Key sequence from  '"+input+"' with focus on 'inputtagInfo'.", inputField);   	
            inputField.FindAdapter<InputTag>().PressKeys(input);
            
            Delay.Milliseconds(300) ;
        }
        
        /// <summary>
        /// This is a placeholder text. Please describe the purpose of the
        /// user code method here. The method is published to the user code library
        /// within a user code collection.
        /// </summary>
        [UserCodeMethod]
        public static void validateInnertextWithXMLtag(RepoItemInfo UIobject, string xmlTagName)
        {
           
             //get some Data from PRoduct
            string ProjectName=TestSuite.Current.Parameters["ProjectName"]; 
            string HGSmeldungsPfad = TestSuite.Current.Parameters["HGSmeldungsPfad"];       
            string xmlFilePath = HGSmeldungsPfad+"\\TRANSFER\\transfer_"+ProjectName+".xml";

	        try
	        {
	        	 // Laden der XML-Datei
				 XmlDocument xmlDoc = new XmlDocument();	           

	        	 xmlDoc.Load(xmlFilePath);
	            
	             XmlNode validNode = xmlDoc.SelectSingleNode("//"+xmlTagName);
		        	
		        	if (validNode != null)
		        		
		            {
		        		string suchErgebnis = validNode.InnerText;
			        	
		        		Report.Log(ReportLevel.Info, "Validation", "Validating AttributeEqual (InnerText="+suchErgebnis+") on item 'UIobject'.", UIobject);
			            Validate.AttributeEqual(UIobject, "InnerText", suchErgebnis);
		        	}
            
	        }catch(XmlException ex){
	        	
		        Report.Error("Fehler beim Verarbeiten der XML-Datei: " + ex.Message);
	            Validate.Fail("Es gab einen Fehler bei der Verarbeitung der XML-Datei: " + ex.Message);        		
	            
	        }catch(Exception ex){	     

		        Report.Error("Fehler beim Verarbeiten: " + ex.Message);
	            Validate.Fail("Es gab einen Fehler bei der Verarbeitung: " + ex.Message);        		        	
	            
	        }
        }
        
        /// <summary>
		/// This is a placeholder text. Please describe the purpose of the
		/// user code method here. The method is published to the user code library
		/// within a user code collection.
		/// </summary>
		[UserCodeMethod]
		public static void setTimePeriod(RepoItemInfo Popup,RepoItemInfo DatePicker, string Auswahl)
		{
			if  (!Auswahl.IsEmpty()) {
				
				// 1. Datepciker ausloesen
				DatePicker.FindAdapter<Button>().Click();
				
				
				// popup offen			
				
				DivTag popup = Popup.FindAdapter<DivTag>();
				
				
				try{
					
					PTag selectbutn	=popup.FindSingle(".//p[@innertext='"+Auswahl+"']");
					selectbutn.Click();
					
					Button confirmbtn	=popup.FindSingle(".//button[#'confirmButton']");
					confirmbtn.Click();
					
				}catch(Exception ex){
					
					Report.Failure("NotFound","In der Datumsauswahl gibt es den Link '"+Auswahl+"' nicht, bitte prüfen.");
					Report.Failure("Exception",ex.Message);
					Button abbruch	=popup.FindSingle(".//button[#'cancelButton']");
					abbruch.Click();
					
					 Validate.Fail("In der Datumsauswahl gibt es den Link '"+Auswahl+"' nicht, bitte prüfen.");
				}
				
				
			}

		}
		/// <summary>
		/// This is a placeholder text. Please describe the purpose of the
		/// user code method here. The method is published to the user code library
		/// within a user code collection.
		/// </summary>
		[UserCodeMethod]	   
		public static void SetSelectFilter(RepoItemInfo FilterObjekt, string FilterName, RepoItemInfo Popup)
        {
        	 
        	string[] FilternameList;
        	
        	FilternameList= FilterName.Split(';');
        	

        	FilterObjekt.FindAdapter<Button>().Click();
        	 Report.Log(ReportLevel.Info, "info", "Popup geöffnet");
        
             if (Popup.Exists())	{
        	 	for (int i=0;i<FilternameList.Length;i++){
        	 
        	 
		        	// nun sollte der Filter offen sein
		        	SpanTag FoundFilteItemr= Popup.FindAdapter<DivTag>().FindSingle("div//span[@innertext='"+FilternameList[i]+"']");
					if (FoundFilteItemr == null)
						return;
					FoundFilteItemr.EnsureVisible();
					FoundFilteItemr.Click();
					Report.Log(ReportLevel.Info, FilternameList[i], "selected");
				
        	 	}
	       	
	        	//okbutton
	        	Button ok =Popup.FindAdapter<DivTag>().FindSingle("div//button[@innertext='OK']");
				if (ok == null)
					return;
				
				ok.Click();
	        	Report.Log(ReportLevel.Info, "OK", "OK clicked ");
	        	
	        	
        	 }
        }
		
		/// <summary>
		/// This is a placeholder text. Please describe the purpose of the
		/// user code method here. The method is published to the user code library
		/// within a user code collection.
		/// </summary>
		[UserCodeMethod]
		public static string PreisConverter( string input){

            string[] preis=input.Split('#');
            if (preis[0].Length<2) preis[0] = "0"+preis[0];
			if (preis[0].Length<3) preis[0] = "0"+preis[0];		

			preis[0]= preis[0].Substring(0,preis[0].Length-2)+","+preis[0].Substring(preis[0].Length-2);				
//			Report.Log(ReportLevel.Info, "Validation","preis:"+preis[0]);			
			return preis[0];
        }
		/// <summary>
		/// This is a placeholder text. Please describe the purpose of the
		/// user code method here. The method is published to the user code library
		/// within a user code collection.
		/// </summary>
		[UserCodeMethod]
		public static  string PreisConverter( string input, bool invers){
            
			string[] preis=input.Split('#');
			int preisIndex=0;
			if (invers) {
				preisIndex=1;
			}
			
            if (preis[preisIndex].Length<2) preis[preisIndex] = "0"+preis[preisIndex];
			if (preis[preisIndex].Length<3) preis[preisIndex] = "0"+preis[preisIndex];		

			preis[preisIndex]= preis[preisIndex].Substring(0,preis[preisIndex].Length-2)+","+preis[preisIndex].Substring(preis[preisIndex].Length-2);				
	
			return preis[preisIndex];
        }
		
    }
}
