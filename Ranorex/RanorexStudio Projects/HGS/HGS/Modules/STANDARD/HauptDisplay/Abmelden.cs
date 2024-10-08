﻿///////////////////////////////////////////////////////////////////////////////
//
// This file was automatically generated by RANOREX.
// DO NOT MODIFY THIS FILE! It is regenerated by the designer.
// All your modifications will be lost!
// http://www.ranorex.com
//
///////////////////////////////////////////////////////////////////////////////

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
using Ranorex.Core.Repository;

namespace Cottbus_3000CR.Modules.STANDARD.HauptDisplay
{
#pragma warning disable 0436 //(CS0436) The type 'type' in 'assembly' conflicts with the imported type 'type2' in 'assembly'. Using the type defined in 'assembly'.
    /// <summary>
    ///The Abmelden recording.
    /// </summary>
    [TestModule("6e6d19c2-b3bf-4c42-86af-1f040f46e678", ModuleType.Recording, 1)]
    public partial class Abmelden : ITestModule
    {
        /// <summary>
        /// Holds an instance of the global::Cottbus_3000CR.HGS repository.
        /// </summary>
        public static global::Cottbus_3000CR.HGS repo = global::Cottbus_3000CR.HGS.Instance;

        static Abmelden instance = new Abmelden();

        /// <summary>
        /// Constructs a new instance.
        /// </summary>
        public Abmelden()
        {
        }

        /// <summary>
        /// Gets a static instance of this recording.
        /// </summary>
        public static Abmelden Instance
        {
            get { return instance; }
        }

#region Variables

#endregion

        /// <summary>
        /// Starts the replay of the static recording <see cref="Instance"/>.
        /// </summary>
        [System.CodeDom.Compiler.GeneratedCode("Ranorex", global::Ranorex.Core.Constants.CodeGenVersion)]
        public static void Start()
        {
            TestModuleRunner.Run(Instance);
        }

        /// <summary>
        /// Performs the playback of actions in this recording.
        /// </summary>
        /// <remarks>You should not call this method directly, instead pass the module
        /// instance to the <see cref="TestModuleRunner.Run(ITestModule)"/> method
        /// that will in turn invoke this method.</remarks>
        [System.CodeDom.Compiler.GeneratedCode("Ranorex", global::Ranorex.Core.Constants.CodeGenVersion)]
        void ITestModule.Run()
        {
            Mouse.DefaultMoveTime = 300;
            Keyboard.DefaultKeyPressTime = 20;
            Delay.SpeedFactor = 1.00;

            Init();

            Report.Log(ReportLevel.Info, "Mouse", "Mouse Left Click item 'TicketingInside_DImasPlus.Abmelden.Einstellungen' at Center.", repo.TicketingInside_DImasPlus.Abmelden.EinstellungenInfo, new RecordItemIndex(0));
            repo.TicketingInside_DImasPlus.Abmelden.Einstellungen.Click();
            Delay.Milliseconds(0);
            
            Report.Log(ReportLevel.Info, "Mouse", "Mouse Left Click item 'TicketingInside_DImasPlus.Abmelden.Logout' at Center.", repo.TicketingInside_DImasPlus.Abmelden.LogoutInfo, new RecordItemIndex(1));
            repo.TicketingInside_DImasPlus.Abmelden.Logout.Click();
            Delay.Milliseconds(0);
            
        }

#region Image Feature Data
#endregion
    }
#pragma warning restore 0436
}
