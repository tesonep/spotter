Class {
	#name : #MethodSelectorBeginsWithFilter,
	#superclass : #BeginsWithFilter,
	#category : #'GT-Spotter-New'
}

{ #category : #accessing }
MethodSelectorBeginsWithFilter >> isValid: aMethod [

	^ aMethod selector asLowercase beginsWith: text asLowercase
]
