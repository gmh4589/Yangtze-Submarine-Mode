Scriptname _APL_Teleport_Script extends ObjectReference

GlobalVariable property reapairStatus0 auto
GlobalVariable property reapairStatus1 auto
GlobalVariable property reapairStatus2 auto
GlobalVariable property reapairStatus3 auto
GlobalVariable property reapairStatus4 auto
GlobalVariable property reapairStatus5 auto
GlobalVariable property reapairStatus6 auto
GlobalVariable property reapairStatus7 auto
GlobalVariable property reapairStatus8 auto
GlobalVariable property reapairStatusReactor auto
GlobalVariable property somethingWrong auto

objectReference property tpMarker0_FarHarbourPort auto
objectReference property tpMarker1_LongFellow auto
objectReference property tpMarker2_ChildAtomCaveFH auto
objectReference property tpMarker3_Airport auto
objectReference property tpMarker4_AtomicCats auto
objectReference property tpMarker5_Bridge auto
objectReference property tpMarker6_FinchFerm auto
objectReference property tpMarker8_Fort auto
objectReference property tpMarker9_Nahant auto
objectReference property tpMarker10_KingsportLighthouse auto
objectReference property tpMarker11_SpectaclIsland auto
objectReference property tpMarker12_TackerBridge auto

miscObject property NucaMat auto

actor property playerRef auto

message property APL_Teleport_Message auto
message property APL_NotTeleport_Message auto
message property APL_TeleportAnswere_Message auto

event OnActivate(ObjectReference TriggerRef)
		
		if (somethingWrong.GetValue() == 1.00)
			APL_NotTeleport_Message.show()
		else
			int iButton = APL_Teleport_Message.show()

			if (iButton == 0)
				teleport(tpMarker0_FarHarbourPort)
				
			elseIf (iButton == 1)
				teleport(tpMarker1_LongFellow)
				
			elseIf (iButton == 2)
				teleport(tpMarker2_ChildAtomCaveFH)
				
			elseIf (iButton == 3)
				teleport(tpMarker3_Airport)
				
			elseIf (iButton == 4)
				teleport(tpMarker4_AtomicCats)
				
			elseIf (iButton == 5)
				teleport(tpMarker5_Bridge)
				
			elseIf (iButton == 6)
				teleport(tpMarker6_FinchFerm)
				
			elseIf (iButton == 7)
				teleport(tpMarker8_Fort)
				
			elseIf (iButton == 8)
				teleport(tpMarker9_Nahant)
				
			elseIf (iButton == 9)
				(tpMarker10_KingsportLighthouse)
					
			elseIf (iButton == 10)
				teleport(tpMarker11_SpectaclIsland)
					
			elseIf (iButton == 11)
				teleport(tpMarker12_TackerBridge)
			endIf
		endIf
endEvent

function Teleport(objectReference marker)
	int iButton2 = APL_TeleportAnswere_Message.show()
		if (iButton2 == 0)
			if (playerRef.GetItemCount(NucaMat) >= 46)
				playerRef.RemoveItem(NucaMat, 46)
				playerRef.moveto(marker)
				debug.notification("You have arrived at your destination")
			else
				debug.notification("Low fuel!")
				debug.notification("You have: " + playerRef.GetItemCount(NucaMat) + " need: 46")
			endIf
		endIf
endFunction

