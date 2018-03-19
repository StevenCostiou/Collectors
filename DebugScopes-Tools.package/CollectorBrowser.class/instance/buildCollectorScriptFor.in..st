building
buildCollectorScriptFor: collector in: a
	a tabulator
		with: [ :browser | 
			browser row: #onCollect.
			browser row: #onRelease.
			browser row: #condition.
			browser row: #scopedEntity.
			browser transmit
				to: #onCollect;
				andShow: [ :b | 
					b title: 'Collect action'.
					self
						sourceEdition: collector collectActionBlock
						forCollector: collector
						accessor: #onCollectDo:
						in: b ].
			browser transmit
				to: #onRelease;
				andShow: [ :b | 
					b title: 'Release action'.
					self
						sourceEdition: collector releaseActionBlock
						forCollector: collector
						accessor: #onReleaseDo:
						in: b ].
			browser transmit
				to: #condition;
				andShow: [ :b | 
					b title: 'Collection condition'.
					self
						sourceEdition: collector condition
						forCollector: collector
						accessor: #condition:
						in: b ].
			browser transmit
				to: #scopedEntity;
				andShow: [ :b | 
					b title: 'Scoped to objects'.
					b table
						updateOn: ObjectCollectorHasChanged from: [ DebugScopeGlobalAnnouncer default weak ];
						selectionAct: [ :presentation | presentation selection inspect ] entitled: 'Inspect';
						display: [ collector weakObject ifNil: [ #() ] ] ] ]