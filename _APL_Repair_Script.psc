Scriptname _APL_Repair_Script extends ObjectReference

GlobalVariable property reapairStatusReactor auto
GlobalVariable property repairStatusGLob auto

actor property playerRef auto

miscObject property c_Steel_scrap auto
miscObject property c_Lead_scrap auto
miscObject property c_NuclearMaterial_scrap auto
miscObject property c_Screws_scrap auto
miscObject property c_Copper_scrap auto
 
message property APL_Repair_Message auto
message property APL_NotRepair_Message auto

bool repair1SteelComplete
bool repair1LeadComplete
bool repair1NuclearMaterialComplete
bool repair1ScrewsComplete
bool repair1CopperComplete
float repair1CompleteAll
float repairStatus
	
event OnActivate(ObjectReference TriggerRef)
		
	if (reapairStatusReactor.GetValue() == 0.000)
		repair1SteelComplete = false
		repair1LeadComplete = false
		repair1NuclearMaterialComplete = false
		repair1ScrewsComplete = false
		repair1CopperComplete = false
	endIf
	
		int repair1Cost = Utility.RandomInt(25, 50)
		int repair2Cost = Utility.RandomInt(25, 50)
		int repair3Cost = Utility.RandomInt(25, 50)
		int repair4Cost = Utility.RandomInt(10, 30)
		int repair5Cost = Utility.RandomInt(10, 30)
	
		if (triggerRef == playerRef) && (reapairStatusReactor.GetValue() < 1.00)
			int iButton = APL_Repair_Message.show()

				if (iButton == 0)
					repairAPL(repair1SteelComplete, c_Steel_scrap, repair1Cost, "steel", "steels")

				elseIf (iButton == 1)
					repairAPL(repair1LeadComplete, c_Lead_scrap, repair2Cost, "lead", "leads")
					
				elseIf (iButton == 2)
					repairAPL(repair1NuclearMaterialComplete, c_NuclearMaterial_scrap, repair3Cost, "nuka material", "nuka materials")
					
				elseIf (iButton == 3)
					repairAPL(repair1ScrewsComplete, c_Screws_scrap, repair4Cost, "screw", "screws")
					
				elseIf (iButton == 4)
					repairAPL(repair1CopperComplete, c_Copper_scrap, repair5Cost, "copper", "coppers")
				endIf
		else
			debug.notification("Reactor repair status 100%")
		endIf
endEvent

function repairAPL(bool status, miscObject item, int cost, string msg1, string msg2)
	if (status == false)
		if (playerRef.GetItemCount(item) >= cost)
			playerRef.RemoveItem(item, cost)
			status = true
			repairStatus = reapairStatusReactor.GetValue() + 0.2
			reapairStatusReactor.SetValue(repairStatus)
			repair1CompleteAll = reapairStatusReactor.GetValue()*100
			debug.notification("Reactor repair status " + repair1CompleteAll + "%")
				if (reapairStatusReactor.GetValue() == 1.00)
					debug.notification("Reactor status: repair is complete.")
					repairStatusGLob.SetValue(1.00)
				endIf
		else
			debug.notification("Low level " + msg1 + "!")
			debug.notification("You have: " + playerRef.GetItemCount(item) + ", need: " + cost)
		endIf
	elseIf (status == true)
		debug.notification("You use " + msg2 + "!")
	endIf
endFunction
