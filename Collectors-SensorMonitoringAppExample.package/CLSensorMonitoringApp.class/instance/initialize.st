initialization
initialize
	running := false.
	process := nil.
	sensors := OrderedCollection new.
	sensors add: CLLightSensor new.
	sensors add: CLTemperatureSensor new.
	sensors add: CLSoundSensor new.
	sensors add: CLProximitySensor new.
	errors := OrderedCollection new.
	^ self