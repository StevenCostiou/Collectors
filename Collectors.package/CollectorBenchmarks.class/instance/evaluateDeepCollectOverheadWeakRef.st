evaluating
evaluateDeepCollectOverheadWeakRef
	| baseExecTime instrumentedExecTime overhead |
	baseExecTime := self bench.
	self setUp.
	instrumentedExecTime := self bench.
	"self tearDown."
	overhead := (instrumentedExecTime / baseExecTime) asFloat - 1.
	^ {baseExecTime.
	instrumentedExecTime.
	overhead}