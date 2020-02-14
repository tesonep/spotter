Class {
	#name : #BeginsWithFilter,
	#superclass : #Object,
	#instVars : [
		'inner',
		'text',
		'previousResult',
		'previousText'
	],
	#category : #'GT-Spotter-New'
}

{ #category : #'instance creation' }
BeginsWithFilter class >> on: aStream [

	^ self new
		inner: aStream;
		yourself
]

{ #category : #accessing }
BeginsWithFilter >> atEnd [ 
	
	^ inner atEnd
]

{ #category : #accessing }
BeginsWithFilter >> filter: aNewFilter [

	text := aNewFilter.

	
]

{ #category : #accessing }
BeginsWithFilter >> get: numberOfResults [

	| result |

	(text asLowercase beginsWith: previousText asLowercase) ifFalse: [ 
		inner reset. 
		previousResult := OrderedCollection new ].
	
	previousText := text asLowercase.
	result := previousResult select: [ :e | self isValid: e ].

	(result size < numberOfResults) ifTrue: [  
		result := result , (self next: (numberOfResults - result size)) ].

	previousResult := result takeFirst: numberOfResults.
	
	^ previousResult.
]

{ #category : #accessing }
BeginsWithFilter >> initialize [

	previousResult := OrderedCollection new.
	previousText := ''
]

{ #category : #accessing }
BeginsWithFilter >> inner: aStream [

	inner := aStream
]

{ #category : #accessing }
BeginsWithFilter >> isValid: aValue [

	^ aValue asLowercase beginsWith: text asLowercase
]

{ #category : #accessing }
BeginsWithFilter >> next [
	| value |
	[ inner atEnd ]
		whileFalse: [ value := inner next.
			(self isValid: value)
				ifTrue: [ ^ value ] ].
	^ nil
]

{ #category : #accessing }
BeginsWithFilter >> next: aQuantity [

	^ Array new: aQuantity streamContents: [ :stream | | total last |
			total := 0.
			[ (last := self next) ifNotNil: [ :each | 
				stream nextPut: each.
				total := total + 1 ] ]
				doWhileTrue: [ total < aQuantity and: [ last notNil ] ] ]
]
