collect - api
collectValue: node
	| collector |
	collector := self new collectValue: node.
	self registry add: collector.
	^ collector