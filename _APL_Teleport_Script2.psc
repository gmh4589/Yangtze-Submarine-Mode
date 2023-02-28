Scriptname _APL_Teleport_Script2 extends ObjectReference

int fireFuel3Cost = 24

objectReference property tpMarker auto

actor property playerRef auto

ammo property fireFuel auto

message property APL_Teleport_Message auto

event OnActivate(ObjectReference TriggerRef)
	if (triggerRef == playerRef)
		int iButton = APL_Teleport_Message.show()

			if (iButton == 0)
				if (playerRef.GetItemCount(fireFuel) >= fireFuel3Cost)
					playerRef.RemoveItem(fireFuel, fireFuel3Cost)
					playerRef.moveto(tpMarker)
				else
					debug.notification("Low fuel!")
				endIf
			endIf
	endIf
endEvent
