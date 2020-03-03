Class {
	#name : #SptHistoryProcessor,
	#superclass : #SptCollectionBasedProcessor,
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #'default-settings' }
SptHistoryProcessor class >> defaultEnabled [

	^ true
]

{ #category : #accessing }
SptHistoryProcessor >> collection [

	^ GTSpotter history reject: [ :e | e isNil ]
]

{ #category : #accessing }
SptHistoryProcessor >> newEntryOn: anElement [

	^ anElement
]

{ #category : #accessing }
SptHistoryProcessor >> order [
	
	^ 8
]

{ #category : #configuration }
SptHistoryProcessor >> showForEmptyQuery [

	^ true
]

{ #category : #accessing }
SptHistoryProcessor >> title [

	^ 'History'
]
