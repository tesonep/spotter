Class {
	#name : #SptImplementorsIterator,
	#superclass : #SptGenericGenerator,
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #accessing }
SptImplementorsIterator >> elementsDo: aValuable [

	SystemNavigation default
		allBehaviorsDo: [ :aClass | aClass methodsDo: aValuable ]
]
