accessing
context
	"rawData always starts by: #(collector value node context)"

	^ context
		ifNil: [ rawData size >= 4
				ifTrue: [ rawData fourth ]
				ifFalse: [ OrderedCollection new ] ]