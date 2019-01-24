instance creation
fromReifications: reificationsDictionary forCollector: collector
	| item |
	item := self new.
	item arguments: (reificationsDictionary at: #arguments ifAbsent: [ nil ] ).
	item receiver:(reificationsDictionary at: #receiver ifAbsent: [ nil ]).
	item entity:(reificationsDictionary at: #entity ifAbsent: [ nil ]).
	item link:(reificationsDictionary at: #link ifAbsent: [ nil ]).
	item name:(reificationsDictionary at: #name ifAbsent: [ nil ]).
	item newValue:(reificationsDictionary at: #newValue ifAbsent: [ nil ]).
	item node:(reificationsDictionary at: #node ifAbsent: [ nil ]).
	item selector:(reificationsDictionary at: #selector ifAbsent: [ nil ]).
	item sender:(reificationsDictionary at: #sender ifAbsent: [ nil ]).
	item copyContext:(reificationsDictionary at: #context ifAbsent: [ nil ]).
	item variable:(reificationsDictionary at: #variable ifAbsent: [ nil ]).
	reificationsDictionary
		at: #value
		ifPresent: [ :e | 
			item oldValue: e copy.
			item sourceObject: e.
			item collectedObject: e deepCopy. ].
	item objectReification:(reificationsDictionary at: #object ifAbsent: [ nil ]).
	item sourceObjectClass:(reificationsDictionary at: #class ifAbsent: [ nil ]).
	item timestamp: Time now.
	^ item