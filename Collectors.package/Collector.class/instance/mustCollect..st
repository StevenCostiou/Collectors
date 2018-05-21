collecting - control
mustCollect: reifications
	^ configuration conditions
		inject: true
		into: [ :bool :condition | 
			[ bool and: [ condition evaluateWith: reifications ] ]
				on: Error
				do: [ false ] ]