deep collection
testDeepCollect
 |col|
col := Collector collectInstVarNamed: 'instVar' inClass: AnObjectWithInstVar.
col deepCollect: #(#name #value #class ).

self assert: col deepCollect.
self assert: col deepCollectReifications equals: #(#name #value #class )
