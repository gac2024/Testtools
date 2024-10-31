﻿///////////////////////////////////////////////////////////////////////////////
//
// This file was automatically generated by RANOREX.
// Your custom recording code should go in this file.
// The designer will only add methods to this file, so your custom code won't be overwritten.
// http://www.ranorex.com
//
///////////////////////////////////////////////////////////////////////////////

using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;
using System.Drawing;
using System.Threading;
using WinForms = System.Windows.Forms;
using Ranorex;
using Ranorex.Core;
using Ranorex.Core.Repository;
using Ranorex.Core.Testing;

namespace Cottbus_3000CR.Modules.STANDARD.HauptDisplay
{
    public partial class DialogStrukturValidierung
    {
        /// <summary>
        /// This method gets called right after the recording has been started.
        /// It can be used to execute recording specific initialization code.
        /// </summary>
        private void Init()
        {
            // Your recording specific initialization code goes here.
        }

        public void clickOnMenueItem(RepoItemInfo menue, string mainMenueName, string subMenueName)
        {           
    
        	
         string search=".//p[@innertext='"+mainMenueName+"']";	
         // Menuename muss als Repo hinterlegt sein 
         	if (subMenueName.Trim().Length>0){
         	search="div//p[@innertext='"+subMenueName+"']";	

         }
        	
          //suche nach richtigem MenueItem
          PTag MenueItem =  menue.FindAdapter<UlTag>().FindSingle(search);

          // drücke MenueItem
          
           MenueItem.Click();
        	        	
        }

        public void checkTitel(string titel)
        {

        	// 1. gibt es einen Titel ?
        	if (titel.Trim().Length>0){ 
				ArticleTag dialog = repo.TicketingInside_DImasPlus.ContentPage.Self.FindSingle(".//article");
        		
        		// 2. wenn ja dann prüfen 
        	  H5Tag pTitel;
        	    bool success =  dialog.TryFindSingle(".//h5[@innertext='"+titel+"']",out pTitel );
        	   
	        	if (success){
	        		Validate.IsTrue(true,"Titel: '"+titel+"' ist vorhanden.");
	        	}else{
	        		Validate.IsTrue(false,"Titel: '"+titel+"' ist nicht vorhanden.",false);
	        	}    	
        	}else{
        			Report.Info("checkTitel","Es gibt keinen Titel.");
        			
        	}

        }
        
        
        public void checkButton(string buttonName)
        {
           	// 1. gibt es einen buttonName ?
        	if (buttonName.Trim().Length>0){ 
				ArticleTag dialog = repo.TicketingInside_DImasPlus.ContentPage.Self.FindSingle(".//article");
        		
        		// 2. wenn ja dann prüfen 
        	    ButtonTag button;
        	    bool success =  dialog.TryFindSingle(".//button[@innertext='"+buttonName+"']",out button );
        	   
	        	if (success){
	        		Validate.IsTrue(true,"Button: '"+buttonName+"' ist vorhanden.");
	        	}else{
	        		Validate.IsTrue(false,"Button: '"+buttonName+"' ist nicht vorhanden.");
	        	}    	
        	}else{
        			Report.Info("checkButton","Es gibt keinen extra Button.");
        			
        	}
        	
        }
                
                

        public void checkTabulatoren(string tabAnzahl, string tabName)
        {
           
        	int cntTabs = 0 ;
        	if (tabAnzahl.Trim().Length>0){
        	
        		cntTabs = Int32.Parse(tabAnzahl);
        	    }
        		
        	
        	Report.Info("checkTabulatoren","Anzahl der Tabs: "+cntTabs);
        	if (cntTabs > 0) {
        		
        		
        		var aryTabs = tabName.Split(';');
        	
        		if (aryTabs.Length != cntTabs) {
        			Report.Error("checkTabulatoren","Die Anzahl der Tabs und die Anzahl der eingetragenen Tab Namen muss übereinstimmen. tabAnzahl:"+cntTabs+ "+ anzahl tabnamen:"+aryTabs.Length );
        			return;
        		}
        		
        		ArticleTag dialog = repo.TicketingInside_DImasPlus.ContentPage.Self.FindSingle(".//article");
        		
        		DivTag tabDiv;
        			
        		if( dialog.TryFindSingle(".//div[@role='tablist']", out tabDiv ) ){
        			var tabList =  tabDiv.FindChildren<ButtonTag>();
        			//check if count of tablist == tabAnzahl
        			if (tabList.Count != cntTabs) {
        				Validate.IsTrue(false,"Die Tabulatorenanzahl stimmt nicht überein. Soll: "+cntTabs+" Ist:"+tabList.Count,false);
        				
        			}else{       			
	        			for ( int i=0;i<cntTabs;i++ ) {
	        				Validate.Exists(tabList[i].GetPath()+"/Div[@InnerText='"+aryTabs[i]+"']");
	        			} 
        			}
        		}else{
        			Validate.IsTrue(false,"Tabs müssen vorhanden sein, es wurden aber keine gefunden.",false);
        		}
        		
        		        	
        	}else{
        			Report.Info("checkTabulatoren","Es gibt keine Tabs .");
        			
        	}
        	   	
        }



        public void checkTableStruktur(string tableTyp, string tableCmdItems)
        {
            ArticleTag dialog = repo.TicketingInside_DImasPlus.ContentPage.Self.FindSingle(".//article");
            // check if table exists
            
            int cntTableCtrls = 0;
            if (tableCmdItems.Trim().Length>0){ 
        	
        		cntTableCtrls = Int32.Parse(tableCmdItems);
            }
            
            int typ = 0;
            if (tableTyp.Trim().Length>0){ 
        	
        		typ = Int32.Parse(tableTyp);
            }
            
            
            
            TableTag Tabelle;
            if (dialog.TryFindSingle(".//Table", out Tabelle) ) {
            	
            	DivTag controlpanel = Tabelle.Parent.Parent.FindChildren<DivTag>()[0].FindChild<DivTag>();
            	
            	
            	
            	var ctrlItemList = controlpanel.Children;         
            	
            	int cntCtrl=0;
            	          	
            	foreach ( Element item in ctrlItemList ){
            	

            		if (item.Visible) cntCtrl++;
           		}
            	
            	if (cntTableCtrls == cntCtrl) {
            		Validate.IsTrue(true,"Die Anzahl der Tabellen Kontrols ist korrekt.");
            	}else{
            		Validate.IsTrue(false,"Die Anzahl der Tabellen Kontrols ist inkorrekt. Soll:"+cntTableCtrls+" Ist:"+cntCtrl,false);
            	}
            	            	
            // Typen prüfung  ???	
            	
            	
            }else{
            	if (typ>0)
            		Validate.IsTrue(false,"Es ist keine Tabelle vorhanden.",false);
                       	
            }
            	
            	
            
        }


    }
}