collecting api
onCollectDo: aBlock
	collectAction := aBlock.
	DebugScopeGlobalAnnouncer default announce: ObjectCollectorHasChanged