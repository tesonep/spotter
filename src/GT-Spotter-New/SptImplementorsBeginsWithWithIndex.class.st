Class {
	#name : #SptImplementorsBeginsWithWithIndex,
	#superclass : #SptGenericGenerator,
	#instVars : [
		'text'
	],
	#classInstVars : [
		'index'
	],
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #enumerating }
SptImplementorsBeginsWithWithIndex class >> calculateIndex [
	| anIndex |
	anIndex := self trieClass new.

	SystemNavigation default
		allBehaviorsDo: [ :aClass | 
			aClass
				methodsDo: [ :e | 
					anIndex 
						at: e selector asLowercase 
						update: [ :methods | methods , { e } ] 
						initial: [ {e} ] ]].
				
	^ anIndex
]

{ #category : #initialization }
SptImplementorsBeginsWithWithIndex class >> generateIndex [

	index := self calculateIndex
]

{ #category : #initialization }
SptImplementorsBeginsWithWithIndex class >> index [

	^ index ifNil: [ index := self calculateIndex ]
]

{ #category : #initialization }
SptImplementorsBeginsWithWithIndex class >> isIndexHealthy [

	^ index isNil or: [ index isCompressed ]
]

{ #category : #initialization }
SptImplementorsBeginsWithWithIndex class >> reset [ 
	
	index := nil
]

{ #category : #enumerating }
SptImplementorsBeginsWithWithIndex class >> trieClass [

	^ CTOptimizedTrie 
]

{ #category : #enumerating }
SptImplementorsBeginsWithWithIndex >> elementsDo: aValuable [

	| node |
	node := self index findPrefix: text.
	node ifNil:[^self].

	node withAllChildrenDo: [:e | 
		e nodeValue ifNotNil: [ e nodeValue do:[:aMethod | aValuable value: aMethod]]]
]

{ #category : #initialization }
SptImplementorsBeginsWithWithIndex >> filteringText: aString [

	text := aString.
	self reset
]

{ #category : #enumerating }
SptImplementorsBeginsWithWithIndex >> index [

	^ self class index
]

{ #category : #initialization }
SptImplementorsBeginsWithWithIndex >> initialize [

	text := ''.
	super initialize.

]
