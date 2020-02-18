Class {
	#name : #SptIteratorDecorator,
	#superclass : #SptIterator,
	#instVars : [
		'inner'
	],
	#category : #'GT-Spotter-New'
}

{ #category : #initialization }
SptIteratorDecorator >> atEnd [ 

	^ inner atEnd
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
