Class {
	#name : #SptIteratorBlockDecorator,
	#superclass : #SptIteratorDecorator,
	#instVars : [
		'aBlock'
	],
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #'instance creation' }
SptIteratorBlockDecorator class >> on: aSptGeneratorIterator with: aBlockClosure [ 
	
	^ self new
		inner: aSptGeneratorIterator;
		block: aBlockClosure;
		yourself
]

{ #category : #accessing }
SptIteratorBlockDecorator >> block: aBlockClosure [

	aBlock := aBlockClosure
]
