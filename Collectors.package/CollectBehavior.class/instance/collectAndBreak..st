collecting
collectAndBreak: anArrayOfReifications
	<debuggerCompleteToSender>
	self collect: anArrayOfReifications.
	CollectPointInspector node: anArrayOfReifications third collector: anArrayOfReifications first.
	Halt now