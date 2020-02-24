"
I implement a simple beginsWith: string filter.
"
Class {
	#name : #SptBeginsWithFilter,
	#superclass : #SptAbstractStringFilter,
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #filtering }
SptBeginsWithFilter >> beginsWithFilter: aString [

	self filteringText: aString
]

{ #category : #protected }
SptBeginsWithFilter >> criterium: aValue [

	^ aValue asString asLowercase beginsWith: filteringText asLowercase


]
