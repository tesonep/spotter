Class {
	#name : #SptSubStringFilter,
	#superclass : #SptIteratorDecorator,
	#instVars : [
		'originalUnwrapped',
		'results',
		'filteringText',
		'returnedIndex'
	],
	#category : #'GT-Spotter-New'
}

{ #category : #'instance creation' }
SptSubStringFilter class >> on: aSptCombinator with: aString [

	^ self new
		originalUnwrapped: aSptCombinator;
		stringFilter: aString
]

{ #category : #accessing }
SptSubStringFilter >> atEnd [

	^ (returnedIndex = results size) and: [ inner atEnd ]
]

{ #category : #accessing }
SptSubStringFilter >> initialize [

	filteringText := ''.
	results := OrderedCollection new.
	returnedIndex := ''.
]

{ #category : #accessing }
SptSubStringFilter >> next [

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
SptSubStringFilter >> originalUnwrapped [
	^ originalUnwrapped
]

{ #category : #accessing }
SptSubStringFilter >> originalUnwrapped: anObject [
	originalUnwrapped := anObject
]

{ #category : #accessing }
SptSubStringFilter >> reset [

	originalUnwrapped reset.
	returnedIndex := 0.
	results := OrderedCollection new
]

{ #category : #accessing }
SptSubStringFilter >> stringFilter: aString [
	
	inner := originalUnwrapped select: [ :e | e asString asLowercase includesSubstring: aString asLowercase].

	(aString asLowercase beginsWith: filteringText asLowercase) ifFalse: [ self reset ].

	results := results select: [ :e | e asString asLowercase includesSubstring: aString asLowercase].
	filteringText := aString.
	returnedIndex := 0.


]
