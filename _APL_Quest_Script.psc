Scriptname _APL_Quest_Script extends ObjectReference

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
 
objectReference property siren auto

Sound Property klaxonSound Auto Const

ActorBase Property Roach Auto Const
ActorBase Property roachBoss Auto Const

int roachCount
int roachBossCount
int varBroc 

event OnCellLoad()
varBroc = Utility.RandomInt(0, 50)

	int a = 0
	int delay = Utility.RandomInt(500, 10000)
	
	debug.notification("Status: system scan.")
	; Ну типа delay...
	while (a < delay)
		a += 1
	endwhile
	
	debug.notification("Status: scaning complete.")

	if (varBroc <= 9)
		int sirenSound = klaxonSound.play(siren)
		Sound.SetInstanceVolume(sirenSound, 1.5)
	endif
	
	if (varBroc == 0)
		setBroc(reapairStatus0, varBroc)
		
	elseif (varBroc == 1)
		setBroc(reapairStatus1, varBroc)
		
	elseif (varBroc == 2)
		setBroc(reapairStatus2, varBroc)
		
	elseif (varBroc == 3)
		setBroc(reapairStatus3, varBroc)
			
	elseif (varBroc == 4)
		setBroc(reapairStatus4, varBroc)
		
	elseif (varBroc == 5)
		setBroc(reapairStatus5, varBroc)
		
	elseif (varBroc == 6)
		setBroc(reapairStatus6, varBroc)
		
	elseif (varBroc == 7)
		setBroc(reapairStatus7, varBroc)
		
	elseif (varBroc == 8)
		setBroc(reapairStatus8, varBroc)
			
	elseif (varBroc == 9)
		reapairStatusReactor.SetValue(0.000)
		somethingWrong.SetValue(0.000)
			debug.notification("The reactor is broken!")
		
			roachCount = Utility.RandomInt(2, 7)
			roachBossCount = Utility.RandomInt(0, 3)

			self.PlaceAtMe(Roach, roachCount)
			self.PlaceAtMe(RoachBoss, roachBossCount)
	else
		debug.notification("Status: all systems is OK. " + varBroc)
	endif
endEvent

function setBroc(GlobalVariable what, int Broc)
	what.SetValue(0.100)
	somethingWrong.SetValue(0.000)
	debug.notification("Broken in modul " + Broc + "!")
endFunction

