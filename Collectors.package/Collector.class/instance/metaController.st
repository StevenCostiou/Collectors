accessing
metaController
	^ metaController ifNil:[metaController := CollectorNullMetaController new]