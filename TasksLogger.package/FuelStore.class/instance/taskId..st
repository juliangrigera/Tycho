retrieving
taskId: id
	^ (self sessionProtocols inject: Set new into: [ :sub :exp | sub , exp tasks ])
		detect: [ :each | each id = id ]
		ifNone: [ nil ]