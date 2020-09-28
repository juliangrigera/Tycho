request handlers
protocolForSession: id
	| resp json |
	monitor
		critical: [ json := nil.
			resp := self store requestProtocolForSession: id.
			resp
				ifNotNil: [ json := RestResponseWriter new
						experimentAsJson: resp
						withSuggestedSampleId: self store newSuggestedSampleId.
					json ].
			^ json ]