Class {
	#name : #SptClassSubstringWithIndex,
	#superclass : #SptClassBeginsWithWithIndex,
	#category : #'GT-Spotter-New-Indexes'
}

{ #category : #enumerating }
SptClassSubstringWithIndex >> elementsDo: aValuable [

	self index 
		withAllValuesWithSubstring: text 
		do: [:aClass | aValuable value: (SptClassEntry on: aClass)]
]
