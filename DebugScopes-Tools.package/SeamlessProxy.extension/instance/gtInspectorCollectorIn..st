*DebugScopes-Tools
gtInspectorCollectorIn: composite
	<gtInspectorPresentationOrder: 30>
	^ composite table
		title: 'Collectors';
		display: [ self collectorsForGtInspector ];
		column: 'Collector' evaluated: [ :each | each remotePrintString ];
		column: 'Scoped to'
			evaluated: [ :each | 
			each weakObject isNil
				ifTrue: [ 'Not scoped' ]
				ifFalse: [ each weakObject == self value
						ifTrue: [ 'self' ]
						ifFalse: [ each weakObject remotePrintString ] ] ];
		selectionAct: [ :each | 
			each selection forObject: self value.
			composite update ]
			entitled: 'Scope to self';
		selectionAct: [ :each | each selection inspect ] entitled: 'Inspect collector';
		selectionAct: [ :each | each selection weakObject inspect ] entitled: 'Inspect scoped entity';
		send: #value