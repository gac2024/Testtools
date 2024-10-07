/*
 * Created by Ranorex
 * User: RanorexAdmin
 * Date: 14.08.2024
 * Time: 08:42
 * 
 * To change this template use Tools > Options > Coding > Edit standard headers.
 */
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.Drawing;
using System.Threading;
using WinForms = System.Windows.Forms;

using Ranorex;
using Ranorex.Core;
using Ranorex.Core.Testing;


using System.Diagnostics;


namespace Cottbus_3000CR.Modules
{
    /// <summary>
    /// Description of UserCodeModule1.
    /// </summary>
    [TestModule("0078E16C-07CB-4603-88D4-199DACB185CC", ModuleType.UserCode, 1)]
    public class ExecuteCommand : ITestModule
    {
        

		[TestVariable("1d09c6b5-db7a-4ed0-a13c-ee2add5d3d37")]
		public string Project { get; set; }

		[TestVariable("536f8a69-f246-4f2b-ae9e-1f62babb2ba9")]
		public string Meldungstyp { get; set; }

		[TestVariable("c15f25ea-9409-4e1a-b76e-cd208bae6c56")]
		public string Meldung { get; set; }



	/// <summary>
        /// Constructs a new instance.
        /// </summary>
        public ExecuteCommand()
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
            
                      
            int ExitCode;
            ProcessStartInfo ProcessInfo;
            Process process;
            
            
            //get some Data from PRoduct
            var HGSmeldungsPfad = TestSuite.Current.Parameters["HGSmeldungsPfad"];
            
            
            
            Report.Log(ReportLevel.Info, "startSendMessage", "Starte das Versenden der Nachricht.");
            
            ProcessInfo = new ProcessStartInfo(HGSmeldungsPfad+"\\startSendMessage.bat "); 
            ProcessInfo.Arguments = this.Project+" "+this.Meldungstyp+" "+this.Meldung; 
            ProcessInfo.WorkingDirectory=HGSmeldungsPfad+"\\";
            process = Process.Start(ProcessInfo);
            process.WaitForExit();
            ExitCode = process.ExitCode;
            process.Close();
            
            if( ExitCode > 0 ) {
            	 Report.Log(ReportLevel.Error, "startSendMessage", "Da ist ein Fehler passiert. (ExitCode = "+ExitCode+")");
            	 Validate.Fail("Die Nachricht an das HGS konnte nicht erfolgreich gesendet werden. (ExitCode = "+ExitCode+") Bitte prüfen.");
         
            }else{
            	 Report.Log(ReportLevel.Success, "startSendMessage", "Nachricht erfolgreich versendet.");
            }
        }
    }
}
