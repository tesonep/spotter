Class {
	#name : #SptImplementorsBeginsWithWithIndex,
	#superclass : #SptGenericGenerator,
	#instVars : [
		'text'
	],
	#classVars : [
		'Index'
	],
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #enumerating }
SptImplementorsBeginsWithWithIndex >> calculateIndex [
	| anIndex |
	anIndex := CTTrie new.

	SystemNavigation default
		allBehaviorsDo: [ :aClass | 
			aClass
				methodsDo: [ :e | 
					anIndex
						add: e selector asLowercase
						valueWithBlock: [ :aString :previousValue | 
							| value |
							value := previousValue ifNil: [ OrderedCollection new ].
							value add: e.
							value ] ] ].
				
	^ anIndex
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

	^ Index ifNil: [ Index := self calculateIndex ]
]

{ #category : #initialization }
SptImplementorsBeginsWithWithIndex >> initialize [

	text := ''.
	super initialize.

]
