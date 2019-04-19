collecting
collectAndBreak: anArrayOfReifications
	<debuggerCompleteToSender>
	(self collect: anArrayOfReifications) ifNil:[^self].
	CollectPointInspector node: anArrayOfReifications third collector: anArrayOfReifications first.
	Halt now