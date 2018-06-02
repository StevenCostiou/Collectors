converting
asNumber
	rawValue ifNil: [ ^ -1 ].
	^ [ rawValue asNumber ]
		on: Error
		do: [ :err | err ]