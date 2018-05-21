running
testReinstallWeak
	| col OmniscientConfig weakConfig |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	OmniscientConfig := CollectorConfiguration new.
	OmniscientConfig reifications addAll: #(#name #node #object).
	col reinstallWith: OmniscientConfig.
	weakConfig := CollectorConfiguration new.
	col reinstallWith: weakConfig.
	self assert: (col installer reifications includes: #name) not.
	self assert: (col reifications includes: #node) not.
	self assert: col installer reifications size equals: 2.
	self assert: col isOmniscient not.
	self assert: col configuration reifications isEmpty.
	self assert: col configuration conditions isEmpty.
	self assert: col configuration transformations isEmpty