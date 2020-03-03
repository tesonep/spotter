"
I am simple processor that iterates on the implementors
"
Class {
	#name : #SptImplementorsProcessor,
	#superclass : #SptSpotterProcessor,
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #'default-settings' }
SptImplementorsProcessor class >> defaultEnabled [

	^ false
]

{ #category : #filtering }
SptImplementorsProcessor >> newTextFilteringSource [

	^ (SptImplementorsIterator new collect: [ :e | SptMethodEntry on: e ]) asSubstringFilter
]

{ #category : #accessing }
SptImplementorsProcessor >> order [
	
	^ 10
]

{ #category : #accessing }
SptImplementorsProcessor >> title [

	^ 'Implementors'
]
