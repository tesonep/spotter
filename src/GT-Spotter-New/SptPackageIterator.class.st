Class {
	#name : #SptPackageIterator,
	#superclass : #SptGenericGenerator,
	#category : #'GT-Spotter-New'
}

{ #category : #accessing }
SptPackageIterator >> elementsDo: aValuable [

	^ RPackageOrganizer default packagesDo: aValuable
]
