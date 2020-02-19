Class {
	#name : #SptCategoryFilterIterator,
	#superclass : #SptIteratorDecorator,
	#instVars : [
		'category',
		'currentCategories'
	],
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #'instance creation' }
SptCategoryFilterIterator class >> category: aCategory for: anInner [

	^ self new 
		category: aCategory;
		inner: anInner;
		yourself
]

{ #category : #filtering }
SptCategoryFilterIterator >> atEnd [ 
	
	^ self isSelected ifTrue: [ inner atEnd ] ifFalse: [ ^ true ]
]

{ #category : #filtering }
SptCategoryFilterIterator >> categoriesSelected: categoriesSelected [ 

	currentCategories := categoriesSelected.
	inner reset.
]

{ #category : #accessing }
SptCategoryFilterIterator >> category [
	^ category
]

{ #category : #accessing }
SptCategoryFilterIterator >> category: anObject [
	category := anObject
]

{ #category : #filtering }
SptCategoryFilterIterator >> initialize [

	super initialize.
	currentCategories := #().
]

{ #category : #filtering }
SptCategoryFilterIterator >> isSelected [ 

	^ currentCategories isEmpty or: [ currentCategories includes: category ]
]

{ #category : #filtering }
SptCategoryFilterIterator >> next [
	
	^ self isSelected ifTrue: [ inner next ] ifFalse: [ ^ nil ]
]
