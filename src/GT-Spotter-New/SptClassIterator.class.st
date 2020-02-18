Class {
	#name : #SptClassIterator,
	#superclass : #SptGenericGenerator,
	#category : #'GT-Spotter-New'
}

{ #category : #accessing }
SptClassIterator >> elementsDo: aValuable [

	^ SystemNavigation default allBehaviorsDo: aValuable
]
