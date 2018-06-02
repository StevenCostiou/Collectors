start/stop
start
	| delay |
	delay := 100 milliSeconds asDelay.
	running := true.
	process := [ [ running ]
		whileTrue: [ | stream |
			stream := WriteStream on: String new.
			sensors do: [ :sensor | sensor printNextReadOn: stream ].
			Transcript clear.
			Transcript crShow: stream contents.
			delay wait ] ] fork