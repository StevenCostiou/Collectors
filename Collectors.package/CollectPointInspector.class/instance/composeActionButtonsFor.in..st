building
composeActionButtonsFor: item in: composite
	| buttons |
	buttons := composite tabulator.
	self
		buildButtonNamed: #inspectObject
		label: 'Inspect Collected Object'
		model: [ item collectedObject inspect ]
		color: Smalltalk ui theme windowColor
		icon: (self iconNamed: #smallInspectIt)
		in: buttons.
		"
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
		in: buttons."
	self
		buildButtonNamed: #useAsReplay
		label: 'Use result as replay'
		model: [ collector replayCollectedItem: item ]
		color: Smalltalk ui theme windowColor
		icon: (self iconNamed: #smallUpdate)
		in: buttons.
	"	
		self
		buildButtonNamed: #inspectContextStack
		label: 'Inspect context stack'
		model: [  item context inspect]
		color: Color green muchLighter
		icon: (self iconNamed: #smallInspectIt)
		in: buttons."