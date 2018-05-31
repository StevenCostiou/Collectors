building
composeActionButtonsFor: item in: composite
	| buttons |
	buttons := composite tabulator.
	self
		buildButtonNamed: #inspectObject
		label: 'Inspect Collected Object'
		model: [ item collectedObject inspect ]
		color: Color gray muchLighter
		icon: (self iconNamed: #smallInspectIt)
		in: buttons.
	self
		buildButtonNamed: #inspectOldValue
		label: 'Inspect old value'
		model: [ item oldValue inspect ]
		color: Color gray muchLighter 
		icon: (self iconNamed: #smallInspectIt)
		in: buttons.
	self
		buildButtonNamed: #inspectNewValue
		label: 'Inspect new value'
		model: [ item newValue inspect ]
		color: Color gray muchLighter
		icon: (self iconNamed: #smallInspectIt)
		in: buttons.
	self
		buildButtonNamed: #useAsReplay
		label: 'Use as replay'
		model: [ collector replayCollectedItem: item ]
		color: Color yellow
		icon: (self iconNamed: #smallUpdate)
		in: buttons