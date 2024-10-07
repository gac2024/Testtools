/*
 * Created by Ranorex
 * User: gac
 * Date: 05.09.2024
 * Time: 14:11
 * 
 * To change this template use Tools > Options > Coding > Edit standard headers.
 */
using System;
using System.Xml;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.Drawing;
using System.Threading;
using WinForms = System.Windows.Forms;


using Ranorex;
using Ranorex.Core;
using Ranorex.Core.Testing;

namespace Cottbus_3000CR.SETUP
{
    /// <summary>
    /// Description of Konfiguration.
    /// </summary>
    [TestModule("A8292AC2-055B-4100-809A-4DC6A8791482", ModuleType.UserCode, 1)]
    public class ConfigurationProject : ITestModule
    {
        /// <summary>
        /// Constructs a new instance.
        /// </summary>
        public ConfigurationProject()
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
            
            string[] parameter = {"PdfDirectoryPath","To","From",
            	"ServerHostname","ServerPort","SendEmailOnFailure","SendEmailOnSuccess",
            	"SendZippedReportOnComplete","SendPdfReportOnComplete",
            	"HGSmeldungsPfad","ProjectName","DPlusUrl","DPlusUser","DPlusPasswort","HGSUrl"};
            
            
            // Was für modifizierbare Daten gibt es ? 
            string xmlFilePath = "startConfiguration_"+TestSuite.Current.Parameters["ProjectName"]+".xml";
        	try
	        {
	        	 // Laden der XML-Datei
				 XmlDocument xmlDoc = new XmlDocument();	           
	        	 xmlDoc.Load(xmlFilePath);

	        	 foreach (string property in parameter ){
	        	 	string strValue=xmlDoc.SelectSingleNode("//"+property).InnerText;
	        	 	Report.Info("configuration","Property '"+property+"' set to '"+strValue+"'");
	        	 	TestSuite.Current.Parameters[property] = strValue;
	        	 }        	 
             }catch(Exception ex){	     
	            Report.Warn("Fehler beim Verarbeiten der XML-Datei: " + ex.Message);
	        }
            
        }
    }
}
