Class {
	#name : #SptIteratorDecorator,
	#superclass : #SptIterator,
	#instVars : [
		'inner'
	],
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #initialization }
SptIteratorDecorator >> atEnd [ 

	^ inner atEnd
]

{ #category : #filtering }
SptIteratorDecorator >> filteringText: aString [ 
	
	inner filteringText: aString
]

{ #category : #accessing }
SptIteratorDecorator >> inner: anObject [
	inner := anObject
]

{ #category : #initialization }
SptIteratorDecorator >> next [

	^ inner next
]

{ #category : #initialization }
SptIteratorDecorator >> reset [ 
	
	inner reset
]
