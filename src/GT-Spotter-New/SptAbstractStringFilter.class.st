Class {
	#name : #SptAbstractStringFilter,
	#superclass : #SptIteratorDecorator,
	#instVars : [
		'returnedIndex',
		'originalUnwrapped',
		'results',
		'filteringText'
	],
	#category : #'GT-Spotter-New'
}

{ #category : #'instance creation' }
SptAbstractStringFilter class >> on: aSptCombinator with: aString [

	^ self new
		originalUnwrapped: aSptCombinator;
		filteringText: aString
]

{ #category : #accessing }
SptAbstractStringFilter >> atEnd [

	^ (returnedIndex = results size) and: [ inner atEnd ]
]

{ #category : #accessing }
SptAbstractStringFilter >> filteringText: aString [

	inner := originalUnwrapped select: [ :e | self criterium: e].

	(aString asLowercase beginsWith: filteringText asLowercase) 
		ifFalse: [ self reset ].

	filteringText := aString.
	results := results select: [ :e | self criterium: e].
	returnedIndex := 0.


]

{ #category : #accessing }
SptAbstractStringFilter >> initialize [

	filteringText := ''.
	results := OrderedCollection new.
	returnedIndex := ''.
]

{ #category : #accessing }
SptAbstractStringFilter >> next [

	| nextOne |

	(returnedIndex < results size) ifTrue: [  
		returnedIndex := returnedIndex + 1.
		^ results at: returnedIndex.	
	].

	nextOne := super next.
	
	nextOne 
		ifNil: [ ^ nil ].
	
	results add: nextOne.
	returnedIndex := results size.
	
	^ nextOne
]

{ #category : #accessing }
SptAbstractStringFilter >> originalUnwrapped [
	^ originalUnwrapped
]

{ #category : #accessing }
SptAbstractStringFilter >> originalUnwrapped: anObject [
	originalUnwrapped := anObject
]

{ #category : #accessing }
SptAbstractStringFilter >> reset [

	originalUnwrapped reset.
	returnedIndex := 0.
	results := OrderedCollection new
]
