Class {
	#name : #SptImplementorsSubstringWithIndex,
	#superclass : #SptImplementorsBeginsWithWithIndex,
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #enumerating }
SptImplementorsSubstringWithIndex class >> calculateIndex [
	| anIndex |
	anIndex := self trieClass new.

	SystemNavigation default
		allBehaviorsDo: [ :aClass | 
			aClass
				methodsDo: [ :e | 
					anIndex 
						atSuffixesOf: (e selector asLowercase copyReplaceAll: ':' with: '')
						update: [ :methods | methods , { e } ] 
						initial: [ {e} ] ] ].

	^ anIndex
]

{ #category : #enumerating }
SptImplementorsSubstringWithIndex class >> trieClass [

	^ CTSuffixTree
]
