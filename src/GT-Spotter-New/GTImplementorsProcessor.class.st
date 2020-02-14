Class {
	#name : #GTImplementorsProcessor,
	#superclass : #GTBeginsWithProcessor,
	#category : #'GT-Spotter-New'
}

{ #category : #acting }
GTImplementorsProcessor >> actOn: aMethod for: aGTSpotterStep [ 

	aMethod browse.
	aGTSpotterStep exit.
]

{ #category : #accessing }
GTImplementorsProcessor >> keyBinding [
	
	^ $m meta
]

{ #category : #filtering }
GTImplementorsProcessor >> newFilter [

	^ MethodSelectorBeginsWithFilter on: self newIterator
]

{ #category : #acting }
GTImplementorsProcessor >> newIterator [

	^ GeneratorBlockIterator
		on: [ :aBlock | 
			SystemNavigation default
				allBehaviorsDo: [ :aClass | aClass methodsDo: aBlock ] ]
]

{ #category : #'as yet unclassified' }
GTImplementorsProcessor >> objectForName: aMethod [

	^ aMethod
		
]

{ #category : #'as yet unclassified' }
GTImplementorsProcessor >> originalCollection [

	^ RPackageOrganizer default packageNames
]

{ #category : #'as yet unclassified' }
GTImplementorsProcessor >> render: aPackage [
		
	^ GTSpotterItemBrick new
		icon: (Smalltalk ui icons iconNamed: #packageIcon);
		text: aPackage name
]

{ #category : #accessing }
GTImplementorsProcessor >> title [
	^ 'Implementors'
]
