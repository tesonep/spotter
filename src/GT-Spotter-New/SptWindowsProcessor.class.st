Class {
	#name : #SptWindowsProcessor,
	#superclass : #SptCollectionBasedProcessor,
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #'default-settings' }
SptWindowsProcessor class >> defaultEnabled [

	^ true
]

{ #category : #filtering }
SptWindowsProcessor >> collection [

	^ (self currentWorld submorphs 	select: [ :window | window isKindOf: SystemWindow ] ) allButFirst
]

{ #category : #filtering }
SptWindowsProcessor >> newEntryOn: anElement [

	^ SptWindowEntry on: anElement
]

{ #category : #accessing }
SptWindowsProcessor >> order [
	
	^ 5
]

{ #category : #configuration }
SptWindowsProcessor >> showForEmptyQuery [

	^ true
]

{ #category : #accessing }
SptWindowsProcessor >> title [

	^ 'Windows'
]
