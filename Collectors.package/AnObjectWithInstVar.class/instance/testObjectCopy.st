testing
testObjectCopy
	|p1 p2 p3|
	p1 := CLPersonObject new.
	p1 age: 45.
	p2 := CLPersonObject new.
	p2 age: 10.
	p2 parent: p1.
	p3 := CLPersonObject new.
	p3 age: 15.
	p3 parent: nil.	
	
	(p2 parent: (p1 parent: p3)) parent: (p1 parent: nil) 
	
	