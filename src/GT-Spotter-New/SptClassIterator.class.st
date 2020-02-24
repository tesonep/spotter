"
I implement an iteration over all the classes in the system.

"
Class {
	#name : #SptClassIterator,
	#superclass : #SptGenericGenerator,
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #enumerating }
SptClassIterator >> elementsDo: aValuable [

	SystemNavigation default allBehaviorsDo: aValuable
]
