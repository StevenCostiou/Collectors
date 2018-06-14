instance creation
fromReifications: reificationsDictionary
	| item |
	item := self new.
	reificationsDictionary at: #arguments ifPresent: [ :e | item arguments: e ].
	reificationsDictionary at: #receiver ifPresent: [ :e | item receiver: e ].
	reificationsDictionary at: #entity ifPresent: [ :e | item entity: e ].
	reificationsDictionary at: #link ifPresent: [ :e | item link: e ].
	reificationsDictionary at: #name ifPresent: [ :e | item name: e ].
	reificationsDictionary at: #oldValue ifPresent: [ :e | item oldValue: e copy ].
	reificationsDictionary at: #newValue ifPresent: [ :e | item newValue: e ].
	reificationsDictionary at: #node ifPresent: [ :e | item node: e ].
	reificationsDictionary at: #selector ifPresent: [ :e | item selector: e ].
	reificationsDictionary at: #sender ifPresent: [ :e | item sender: e ].
	reificationsDictionary at: #context ifPresent: [ :e | item copyContext: e ].
	reificationsDictionary at: #variable ifPresent: [ :e | item variable: e ].
	reificationsDictionary
		at: #value
		ifPresent: [ :e | 
			item sourceObject: e.
			item collectedObject: e deepCopy. ].
	reificationsDictionary at: #object ifPresent: [ :e | item objectReification: e ].
	reificationsDictionary at: #class ifPresent: [ :e | item sourceObjectClass: e ].
	item timestamp: Time now.
	^ item