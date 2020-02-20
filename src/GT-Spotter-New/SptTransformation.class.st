Class {
	#name : #SptTransformation,
	#superclass : #SptIteratorBlockDecorator,
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #initialization }
SptTransformation >> next [

	^ inner next ifNil: [ nil ] ifNotNil:[ :aValue | self transform: aValue]
]

{ #category : #tranforming }
SptTransformation >> transform: anElement [

	^ aBlock value: anElement
]
