collecting
sortReifications: anArrayOfReifications with: requestedReifications
	| sortedReifications |
	sortedReifications := Dictionary new.
	requestedReifications
		with: anArrayOfReifications
		collect: [ :argument :reification | sortedReifications at: argument put: reification ].
	^ sortedReifications