Class {
	#name : #SptSequenceIterator,
	#superclass : #SptIterator,
	#instVars : [
		'iterators'
	],
	#category : #'GT-Spotter-New'
}

{ #category : #'instance creation' }
SptSequenceIterator class >> with: aCollection [ 
	
	^ self new
		iterators: aCollection;
		yourself
]

{ #category : #accessing }
SptSequenceIterator >> atEnd [ 

	^ iterators allSatisfy: [ :e | e atEnd ]
]

{ #category : #accessing }
SptSequenceIterator >> iterators: aCollection [ 

	iterators := aCollection 
]

{ #category : #accessing }
SptSequenceIterator >> next [

	^ iterators
		detect: [ :e | e atEnd not ]
		ifFound: [ :e | e next ]
		ifNone: [ nil ]
]

{ #category : #accessing }
SptSequenceIterator >> reset [

	^ iterators do: [ :e | e reset ]
]
