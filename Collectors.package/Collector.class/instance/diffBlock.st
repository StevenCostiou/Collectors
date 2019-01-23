accessing
diffBlock
	^ diffBlock ifNil: [ self setDiffBlockFrom: '' ]