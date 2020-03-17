Class {
	#name : #SptImplementorsSubstringWithIndex,
	#superclass : #SptImplementorsBeginsWithWithIndex,
	#category : #'GT-Spotter-New-Indexes'
}

{ #category : #enumerating }
SptImplementorsSubstringWithIndex >> elementsDo: aValuable [

	self index 
		withAllValuesWithSubstring: text 
		do: [:aMethod | aValuable value: (SptMethodEntry on: aMethod)]
]
