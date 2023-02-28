Scriptname _APL_FirstLoad extends ObjectReference

GlobalVariable property firstLoad auto

actor property playerRef auto

key property repairKit auto

event OnCellLoad()
	if (firstLoad.GetValue() == 1.00)
		self.Disable()
	endIf
endEvent
	
event OnActivate(ObjectReference TriggerRef)
	if (triggerRef == playerRef) && (firstLoad.GetValue() == 0.00)
		if (playerRef.GetItemCount(repairKit) >= 1)
			playerRef.RemoveItem(repairKit, 1)
			self.Disable()
			firstLoad.SetValue(1.00)
		else
			debug.notification("To repair the submarine you need create repair kit in the chemical workbanch!")
		endIf
	endIf
endEvent
