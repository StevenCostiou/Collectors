collecting
collectAndBreak: anArrayOfReifications
	<debuggerCompleteToSender>
	(self collect: anArrayOfReifications) ifNil: [ ^ self ].
	captureCount := captureCount + 1.
	captureCount
		>= anArrayOfReifications first configuration breakAfterCount
		ifFalse: [ ^ self ].
	CollectPointInspector
		node: anArrayOfReifications third
		collector: anArrayOfReifications first.
	Halt now