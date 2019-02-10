behavior
configureSelector
	selector := self collector configuration breakAfterCollect
		ifFalse: [ #collect: ]
		ifTrue: [ #collectAndBreak: ]