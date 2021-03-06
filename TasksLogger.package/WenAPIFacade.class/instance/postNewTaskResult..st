request handlers
postNewTaskResult: jsonBody
	| task taskResult sample protocol payload |
	monitor
		critical: [ payload := NeoJSONReader fromString: jsonBody.
			protocol := self experimentFromParameters: payload.
			sample := self sampleFromParameters: payload.
			(protocol samples includes: sample)
				ifFalse: [ protocol addSample: sample ].
			task := self taskFromParameters: payload.
			taskResult := self newTaskResultsFor: task withParameters: payload.
			sample addTaskResult: taskResult.
			self store rememberToSave: protocol.
			self store rememberToSave: sample.
			self store savePending.
			^ 'ok' ]