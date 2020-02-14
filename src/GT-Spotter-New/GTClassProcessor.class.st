Class {
	#name : #GTClassProcessor,
	#superclass : #GTBeginsWithProcessor,
	#category : #'GT-Spotter-New'
}

{ #category : #acting }
GTClassProcessor >> actOn: aClass for: aGTSpotterStep [ 

	aClass browse.
	aGTSpotterStep exit.
]

{ #category : #accessing }
GTClassProcessor >> keyBinding [
	
	^ $b meta
]

{ #category : #'as yet unclassified' }
GTClassProcessor >> objectForName: aName [

	^ Smalltalk classNamed: aName.
		
]

{ #category : #'as yet unclassified' }
GTClassProcessor >> originalCollection [

	^ Smalltalk globals classNames
]

{ #category : #'as yet unclassified' }
GTClassProcessor >> render: aClass [
		
	^ GTSpotterItemBrick new
		icon: aClass systemIcon;
		text: aClass gtDisplayString
]

{ #category : #accessing }
GTClassProcessor >> title [
	^ 'Classes'
]
