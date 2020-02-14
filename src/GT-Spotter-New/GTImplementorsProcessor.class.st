Class {
	#name : #GTImplementorsProcessor,
	#superclass : #GTBeginsWithProcessor,
	#category : #'GT-Spotter-New'
}

{ #category : #acting }
GTImplementorsProcessor >> actOn: aClass for: aGTSpotterStep [ 

	aClass browse.
	aGTSpotterStep exit.
]

{ #category : #accessing }
GTImplementorsProcessor >> keyBinding [
	
	^ nil
]

{ #category : #'as yet unclassified' }
GTImplementorsProcessor >> objectForName: aName [

	^ RPackageOrganizer default packageNamed: aName ifAbsent: [ aName ]
		
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
	^ 'Packages'
]
