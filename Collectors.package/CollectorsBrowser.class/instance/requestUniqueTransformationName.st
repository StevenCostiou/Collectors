building - configuration
requestUniqueTransformationName
	| name transfoNames |
	name := UIManager default request: 'Transformation name' initialAnswer: ''.
	name = ''
		ifTrue: [ UIManager default alert: 'Transformations must be named' title: 'Invalid Name' ].
	transfoNames := selectedCollector configuration transformations collect: [ :transfo | transfo name ].
	(transfoNames includes: name)
		ifTrue: [ UIManager default alert: 'This transformation name already exists' title: 'Invalid Name'. name := '' ].
	^ name