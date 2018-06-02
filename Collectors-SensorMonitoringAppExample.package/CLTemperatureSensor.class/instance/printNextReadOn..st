printing
printNextReadOn: aStream
	aStream cr.
	aStream nextPutAll: 'Temperature:'.
	aStream space.
	([ self readTemperature ]
		on: Error
		do: [ :err | err ]) printOn: aStream.
	aStream space.
	aStream nextPutAll: '¬∞C'