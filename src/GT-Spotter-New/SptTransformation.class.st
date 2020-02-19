Class {
	#name : #SptTransformation,
	#superclass : #SptIteratorBlockDecorator,
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #initialization }
SptTransformation >> next [

	^ self transform: inner next
]

{ #category : #tranforming }
SptTransformation >> transform: anElement [

	^ aBlock value: anElement
]
