globals
averageTimeElapsed
	| avg |
	avg := 0.
	self samples size > 0
		ifTrue: [ avg := ((self samples inject: 0 into: [ :sum :sample | sum + sample averageTimeElapsed ]) / (self samples size asFloat)) ].
	^ avg