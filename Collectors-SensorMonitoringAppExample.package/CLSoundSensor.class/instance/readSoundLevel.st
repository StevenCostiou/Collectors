initialization
readSoundLevel
	^ ((self read asNumber / 1023) asFloat * 100) rounded