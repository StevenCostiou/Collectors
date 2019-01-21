initialization
initializeLink
	link := self newMetaLink.
	link control: self control.
	link metaObject: self behavior.
	link selector: self selector.
	link arguments: self reifications asArray.
	link option: #(argsAsArray)