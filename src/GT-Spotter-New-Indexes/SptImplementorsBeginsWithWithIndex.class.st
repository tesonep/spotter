Class {
	#name : #SptImplementorsBeginsWithWithIndex,
	#superclass : #SptGenericGenerator,
	#instVars : [
		'text'
	],
	#category : #'GT-Spotter-New-Indexes'
}

{ #category : #enumerating }
SptImplementorsBeginsWithWithIndex >> elementsDo: aValuable [

	self index 
		withAllValuesBeginningWith: text 
		do: [:aMethod | aValuable value: (SptMethodEntry on: aMethod)]
]

{ #category : #initialization }
SptImplementorsBeginsWithWithIndex >> filteringText: aString [

	text := aString.
	self reset
]

{ #category : #enumerating }
SptImplementorsBeginsWithWithIndex >> index [

	^ AlpIndexManager current indexAt: #implementors
]

{ #category : #initialization }
SptImplementorsBeginsWithWithIndex >> initialize [

	text := ''.
	super initialize.

]
