Class {
	#name : #BeginsWithFilter,
	#superclass : #Object,
	#instVars : [
		'inner',
		'text'
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
	inner reset

	
]

{ #category : #accessing }
BeginsWithFilter >> inner: aStream [

	inner := aStream
]

{ #category : #accessing }
BeginsWithFilter >> next [
	| value |
	[ inner atEnd ]
		whileFalse: [ value := inner next.
			(value beginsWith: text)
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
