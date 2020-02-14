Class {
	#name : #HasSubStringFilter,
	#superclass : #BeginsWithFilter,
	#category : #'GT-Spotter-New'
}

{ #category : #accessing }
HasSubStringFilter >> isValid: aValue [

	^ aValue asLowercase includesSubstring: text asLowercase
]
