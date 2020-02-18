Class {
	#name : #SptGeneratorBlockIterator,
	#superclass : #SptGenericGenerator,
	#instVars : [
		'block'
	],
	#category : #'GT-Spotter-New'
}

{ #category : #'instance creation' }
SptGeneratorBlockIterator class >> on: aBlock [

	^ self basicNew
		block: aBlock;
		initialize;
		yourself
]

{ #category : #accessing }
SptGeneratorBlockIterator >> block [
	^ block
]

{ #category : #accessing }
SptGeneratorBlockIterator >> block: anObject [
	block := anObject
]

{ #category : #accessing }
SptGeneratorBlockIterator >> elementsDo: aValuable [

	^ block value: aValuable
]
