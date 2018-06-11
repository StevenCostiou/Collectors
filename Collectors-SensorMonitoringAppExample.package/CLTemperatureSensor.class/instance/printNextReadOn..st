printing
printNextReadOn: aStream
	| s |
	s := WriteStream on: String new.
	s cr.
	s nextPutAll: 'Temperature:'.
	s space.
	s nextPutAll: self readTemperature printString.
	s space.
	s nextPutAll: 'Celsius'.
	aStream nextPutAll: s contents