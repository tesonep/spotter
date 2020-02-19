Class {
	#name : #SptSubStringFilter,
	#superclass : #SptAbstractStringFilter,
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #accessing }
SptSubStringFilter >> criterium: aValue [

	^ aValue asString asLowercase includesSubstring: filteringText asLowercase


]

{ #category : #accessing }
SptSubStringFilter >> substringFilter: aString [
	
	self filteringText: aString
]
