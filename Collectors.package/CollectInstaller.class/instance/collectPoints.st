as yet unclassified
collectPoints
	| collectPoints |
	collectPoints := OrderedCollection new.
	collectPoints addAll: self nodes.
	^ collectPoints asArray