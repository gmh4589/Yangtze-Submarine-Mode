Scriptname _APL_Repair_Script2 extends ObjectReference

GlobalVariable property repairStatusGLob auto
GlobalVariable property somethingWrong auto

actor property playerRef auto

miscObject property _Steel auto
miscObject property _Copper auto
miscObject property _Lamp auto

message property APL_Repair_Message auto

bool repairSteelComplete
bool repairCopperComplete
bool repairLampComplete
bool opros = true
float repair1CompleteAll
float repairStatus


event OnCellLoad()
	while (opros == true)
		if (repairStatusGLob.GetValue() < 1.00)
			self.Enable()
			opros = false
		else
			self.Disable()
		endIf
	endwhile
endEvent

event OnActivate(ObjectReference TriggerRef)

	if (repairStatusGLob.GetValue() == 0.100)
		repairSteelComplete = false
		repairCopperComplete = false
		repairLampComplete = false
	endIf
	
	int repairCostSteel = Utility.RandomInt(1, 10)
	int repairCostCopper = Utility.RandomInt(1, 10)
	
		if (triggerRef == playerRef)
				int iButton = APL_Repair_Message.show()

				if (iButton == 0)
					repairAPL2(repairSteelComplete, _Steel, repairCostSteel, "steel", "steels")
					
				elseif (iButton == 1)
					repairAPL2(repairCopperComplete, _Copper, repairCostCopper, "copper", "coppers")
					
				elseif (iButton == 2)
					repairAPL2(repairLampComplete, _Lamp, 1, "blowtorch", "blowtorchs")
					
				endIf
		endIf
endEvent

function repairAPL2(bool status, miscObject item, int cost, string msg1, string msg2)
	if (status == false)
		repairStatus = repairStatusGLob.GetValue()
		if (playerRef.GetItemCount(item) >= cost)
			playerRef.RemoveItem(item, cost)
			status = true
			repairStatus = repairStatus + 0.3
			repairStatusGLob.SetValue(repairStatus)
			repair1CompleteAll = repairStatus*100
			debug.notification("Reapair complete " + repair1CompleteAll + "%")
				if (repairStatusGLob.GetValue() == 1.00)
					debug.notification("Repair is complete!")
					repairStatusGLob.SetValue(1.00)
					somethingWrong.SetValue(0.00)
					self.Disable()
				endIf
		else
			debug.notification("Low level " + msg1 + "!")
			debug.notification("You have: " + playerRef.GetItemCount(item) + ", need: " + cost)
		endIf
	elseIf (status == true)
		debug.notification("You use " + msg2 + "!")
	endIf
endFunction
