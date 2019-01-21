api
read
	| sensorRead |
	sensorRead := CLSensorRead new.
	sensorRead channel: channel.
	sensorRead rawValue: (CLSensorDriver new read: channel).
	^ sensorRead