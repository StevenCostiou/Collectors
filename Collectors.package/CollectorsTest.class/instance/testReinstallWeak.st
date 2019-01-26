running
testReinstallWeak
	| col OmniscientConfig weakConfig |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	OmniscientConfig := CollectorConfiguration new.
	OmniscientConfig reifications addAll: #(#name #link).
	col reinstallWith: OmniscientConfig.
	weakConfig := CollectorConfiguration new.
	col isOmniscient: false.
	col reinstallWith: weakConfig.
	self deny: (col installer reifications includes: #name).
	self deny: (col reifications includes: #link).
	self assert: col installer reifications size equals: 3.
	self assert: col isOmniscient not.
	self assert: col configuration reifications isEmpty.
	self assert: col configuration conditions isEmpty.
	self assert: col configuration transformations isEmpty