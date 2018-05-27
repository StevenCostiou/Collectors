collect - api
collectReceiver: node
	| collector |
	collector := self new collectReceiver: node.
	self registry add: collector.
	^ collector