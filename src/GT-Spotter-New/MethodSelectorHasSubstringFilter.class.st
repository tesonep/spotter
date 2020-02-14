Class {
	#name : #MethodSelectorHasSubstringFilter,
	#superclass : #BeginsWithFilter,
	#category : #'GT-Spotter-New'
}

{ #category : #accessing }
MethodSelectorHasSubstringFilter >> isValid: aMethod [

	^ aMethod selector asLowercase includesSubstring: text asLowercase
]
