Class {
	#name : #SptClassBeginsWithWithIndex,
	#superclass : #SptGenericGenerator,
	#instVars : [
		'text'
	],
	#category : #'GT-Spotter-New-Indexes'
}

{ #category : #enumerating }
SptClassBeginsWithWithIndex >> elementsDo: aValuable [

	self index 
		withAllValuesBeginningWith: text 
		do: [:aClass | aValuable value: (SptClassEntry on: aClass)]
]

{ #category : #initialization }
SptClassBeginsWithWithIndex >> filteringText: aString [

	text := aString.
	self reset
]

{ #category : #enumerating }
SptClassBeginsWithWithIndex >> index [

	^ AlpIndexManager current indexAt: #classes
]

{ #category : #initialization }
SptClassBeginsWithWithIndex >> initialize [

	text := ''.
	super initialize.

]
