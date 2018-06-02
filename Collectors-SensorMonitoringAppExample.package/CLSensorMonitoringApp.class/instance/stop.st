start/stop
stop
	running := false.
	process ifNil: [ ^ self ].
	process terminate.
	process := nil