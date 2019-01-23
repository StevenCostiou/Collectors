private
setDiffBlock
	collector
		setDiffBlockFrom:
			(UIManager default
				request:
					'How to compare objects? #equality, #identity or [:a :b| ...returns a boolean... ]').
	self update