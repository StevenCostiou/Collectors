printing
printNextReadOn: aStream
	aStream cr.
	aStream nextPutAll: 'Light level:'.
	aStream space.
	aStream nextPutAll: self readLightLevel printString.
	aStream nextPut: $%