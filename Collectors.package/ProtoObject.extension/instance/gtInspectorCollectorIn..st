*Collectors
gtInspectorCollectorIn: composite
    <gtInspectorPresentationOrder: 30>
    ^ composite table
        title: 'Collectors';
        display: [ self collectorsForGtInspector ];
        column: 'Collector' evaluated: [ :each | each printDefinition ];
        column: 'Scoped to'
            evaluated: [ :each |
            each weakObject isNil
                ifTrue: [ 'Not scoped' ]
                ifFalse: [ each weakObject == self
                        ifTrue: [ 'self' ]
                        ifFalse: [ each weakObject printString ] ] ];
        selectionAct: [ :each |
            each selection forObject: self.
            composite update ]
            entitled: 'Scope to self';
        selectionAct: [ :each | each selection inspect ] entitled: 'Inspect collector';
        selectionAct: [ :each | each selection weakObject inspect ] entitled: 'Inspect scoped entity';
        send: #value