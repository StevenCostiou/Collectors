building - configuration
requestConditionRename: aPreviousName
	| name conditionsNames |
	name := UIManager default request: 'Condition name' initialAnswer: aPreviousName.
	(name isNil or: [ name isEmpty ])
		ifTrue: [ UIManager default alert: 'You entered no name' title: 'Invalid Name'.
			^ '' ].
	conditionsNames := selectedCollector configuration transformations collect: [ :cond | cond name ].
	(conditionsNames includes: name)
		ifTrue: [ UIManager default alert: 'This condition name already exists' title: 'Invalid Name'.
			^ '' ].
	^ name