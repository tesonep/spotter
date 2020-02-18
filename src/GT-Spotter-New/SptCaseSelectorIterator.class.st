Class {
	#name : #SptCaseSelectorIterator,
	#superclass : #SptIteratorDecorator,
	#instVars : [
		'lowercaseIterator',
		'uppercaseIterator'
	],
	#category : #'GT-Spotter-New'
}

{ #category : #filtering }
SptCaseSelectorIterator >> filteringText: aString [
	aString
		ifEmpty: [ inner := lowercaseIterator.
			^ self ].

	inner := aString first isLowercase
		ifTrue: [ lowercaseIterator ]
		ifFalse: [ uppercaseIterator ].
		
	inner filteringText: aString
]

{ #category : #accessing }
SptCaseSelectorIterator >> lowercaseIterator [
	^ lowercaseIterator
]

{ #category : #accessing }
SptCaseSelectorIterator >> lowercaseIterator: anObject [
	lowercaseIterator := anObject
]

{ #category : #accessing }
SptCaseSelectorIterator >> uppercaseIterator [
	^ uppercaseIterator
]

{ #category : #accessing }
SptCaseSelectorIterator >> uppercaseIterator: anObject [
	uppercaseIterator := anObject
]
