behavior - replay
turnOffReplay
	replayLink ifNil: [ ^ self ].
	replayLink uninstall.
	replayLink := nil.
	self reinstallWith: configuration