initialization
initializeLink
	link := MetaLink new.
	link control: self control.
	link metaObject: self behavior.
	link selector: self selector.
	link arguments: self reifications asArray.
	link option: #(argsAsArray)