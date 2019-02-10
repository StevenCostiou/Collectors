accessing
rawData: anArray
	| collector startIndex stackSize |
	collector := anArray first.
	sourceObject := anArray second.
	rawData := Array new: anArray size.
	rawData at: 1 put: collector.
	rawData at: 2 put: anArray second deepCopy.
	rawData at: 3 put: anArray third.
	startIndex := 4.
	stackSize := collector configuration capturedStackSize.
	stackSize > 0
		ifTrue: [ rawData
				at: 4
				put: (self copyContext: (anArray at: 4) stackSize: stackSize).
			startIndex := startIndex + 1 ].
	startIndex to: anArray size do: [ :i | rawData at: 4 put: (anArray at: i) ]