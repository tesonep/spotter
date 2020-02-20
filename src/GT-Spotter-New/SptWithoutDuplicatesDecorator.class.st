Class {
	#name : #SptWithoutDuplicatesDecorator,
	#superclass : #SptIteratorDecorator,
	#instVars : [
		'uniqueResults'
	],
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #'instance creation' }
SptWithoutDuplicatesDecorator class >> on: anInner [

	^ self new 
		inner: anInner;
		yourself
]

{ #category : #initialization }
SptWithoutDuplicatesDecorator >> initialize [ 

	super initialize.
	uniqueResults := Set new.
]

{ #category : #initialization }
SptWithoutDuplicatesDecorator >> next [

	| aValue |
	aValue := inner next.
	
	[aValue isNotNil and: [ uniqueResults includes: aValue ]]
		whileTrue: [ aValue := inner next ].
		
	uniqueResults add: aValue.
	^ aValue
	
]

{ #category : #initialization }
SptWithoutDuplicatesDecorator >> reset [ 

	inner reset.
	uniqueResults removeAll.
]
