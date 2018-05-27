behavior - replay
replayCollectedItem: item
	|behavior|
	self uninstall.
	replayLink := CollectorMetaLink on: self.
	behavior := installer behavior.
	behavior replayValue: item collectedObject.
	replayLink metaObject: behavior.
	replayLink selector: #replayValue.
	replayLink control: #instead.
	replayLink setReplayMode.
	item node link: replayLink 