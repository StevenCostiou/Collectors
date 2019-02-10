breakpoints
testBreakAfterCollect
	| col |
	col := Collector
		collectInstVarNamed: 'instVar'
		inClass: AnObjectWithInstVar.
	col configuration addReifications: #(#newValue).
	col breakAfterCollect.
	col reinstall.
	self should: [ AnObjectWithInstVar new instVar: 0 ] raise: Halt