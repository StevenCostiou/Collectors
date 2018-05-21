running
testWeakWhenNoReifications
	| col omniConfig weakConfig |
	col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
	omniConfig := CollectorConfiguration new.
	omniConfig reifications addAll: #(#name #node #object).
	weakConfig := CollectorConfiguration new.
	col reinstallWith: omniConfig.
	col reinstallWith: weakConfig.
	self deny: col isOmniscient.
	self assert: (col installer reifications includes: #object) not