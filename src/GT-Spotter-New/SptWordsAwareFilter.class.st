Class {
	#name : #SptWordsAwareFilter,
	#superclass : #SptIteratorDecorator,
	#instVars : [
		'words',
		'realFilter'
	],
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #filtering }
SptWordsAwareFilter >> filteringText: aString [

	| firstWord otherWords |
	words := (aString splitOn: ' ')
		flatCollect: [ :each | each splitCamelCase  ].
	
	firstWord := words first.
	otherWords := words allButFirst collect: [:each | each asLowercase].
		
	realFilter filteringText: firstWord.
	inner := realFilter select: [ :each | 
		otherWords allSatisfy: [ :otherW | each asString asLowercase includesSubstring: otherW ] ].

]

{ #category : #filtering }
SptWordsAwareFilter >> inner: anIterator [

	inner := anIterator.
	realFilter := anIterator
]
