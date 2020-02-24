"
I implement an iterator over all the packages in the system
"
Class {
	#name : #SptPackageIterator,
	#superclass : #SptGenericGenerator,
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #enumerating }
SptPackageIterator >> elementsDo: aValuable [

	RPackageOrganizer default packagesDo: aValuable
]
