Class {
	#name : #SptBeginsWithFilter,
	#superclass : #SptAbstractStringFilter,
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #accessing }
SptBeginsWithFilter >> beginsWithFilter: aString [

	self filteringText: aString
]

{ #category : #accessing }
SptBeginsWithFilter >> criterium: aValue [

	^ aValue asString asLowercase beginsWith: filteringText asLowercase


]
