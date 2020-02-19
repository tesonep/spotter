Class {
	#name : #SptSequenceIterator,
	#superclass : #SptIterator,
	#instVars : [
		'iterators'
	],
	#category : #'GT-Spotter-New-Iterators'
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

{ #category : #initialization }
SptSequenceIterator >> categoriesSelected: categories [ 

	iterators do: [ :e | e categoriesSelected: categories ]
]

{ #category : #accessing }
SptSequenceIterator >> filteringText: aString [

	iterators do: [ :e | e filteringText: aString ]
]

{ #category : #accessing }
SptSequenceIterator >> iterators: aCollection [ 

	iterators := aCollection 
]

{ #category : #accessing }
SptSequenceIterator >> next [

	iterators do: [ :e | e next ifNotNil: [ :aValue | ^ aValue ] ].
	^ nil
]

{ #category : #accessing }
SptSequenceIterator >> reset [

	^ iterators do: [ :e | e reset ]
]
