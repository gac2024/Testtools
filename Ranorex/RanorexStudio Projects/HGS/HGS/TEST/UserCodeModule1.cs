/*
 * Created by Ranorex
 * User: gac
 * Date: 04.09.2024
 * Time: 14:57
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

namespace Cottbus_3000CR.TEST
{
    /// <summary>
    /// Description of UserCodeModule1.
    /// </summary>
    [TestModule("5CF0D1F3-9C17-45A7-9FA6-6A2516B2544B", ModuleType.UserCode, 1)]
    public class UserCodeModule1 : ITestModule
    {
        /// <summary>
        /// Constructs a new instance.
        /// </summary>
        public UserCodeModule1()
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
            
            
            Report.Log(ReportLevel.Info, "Validation","preis:"+erstellePreise("0#EUR"));	
            Report.Log(ReportLevel.Info, "Validation","preis:"+erstellePreise("250#EUR"));	            
            Report.Log(ReportLevel.Info, "Validation","preis:"+erstellePreise("2500#EUR"));	
            Report.Log(ReportLevel.Info, "Validation","preis:"+erstellePreise("25000#EUR"));	
        }
        
        
        private string erstellePreise( string input){
        
            string[] preis=input.Split('#');
            if (preis[0].Length<2) preis[0] = "0"+preis[0];
			if (preis[0].Length<3) preis[0] = "0"+preis[0];		

			preis[0]= preis[0].Substring(0,preis[0].Length-2)+","+preis[0].Substring(preis[0].Length-2);				
//			Report.Log(ReportLevel.Info, "Validation","preis:"+preis[0]);			
			return preis[0];
        }
        
        
    }
}
