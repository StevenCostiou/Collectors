printing
printNextReadOn: aStream
	aStream cr.
	aStream nextPutAll: 'Sound level:'.
	aStream space.
	aStream nextPutAll: self readSoundLevel printString.
	aStream nextPut: $%