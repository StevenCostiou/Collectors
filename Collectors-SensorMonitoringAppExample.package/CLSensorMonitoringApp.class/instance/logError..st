start/stop
logError: errForSensor
	| str |
	str := WriteStream on: String new.
	str nextPutAll: errForSensor key name.
	str tab.
	str nextPutAll: Time now printString.
	str space.
	str nextPutAll: '>>'.
	str crtab.
	errForSensor printOn: str.
	str nextPutAll: ' in '.
	str nextPutAll: errForSensor value signalerContext sender printString.
	errors add: str contents