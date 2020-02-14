Class {
	#name : #GTPackageProcessor,
	#superclass : #GTBeginsWithProcessor,
	#category : #'GT-Spotter-New'
}

{ #category : #acting }
GTPackageProcessor >> actOn: aPackage for: aGTSpotterStep [ 

	aPackage browse.
	aGTSpotterStep exit.
]

{ #category : #accessing }
GTPackageProcessor >> keyBinding [
	
	^ nil
]

{ #category : #'as yet unclassified' }
GTPackageProcessor >> objectForName: aName [

	^ RPackageOrganizer default packageNamed: aName ifAbsent: [ aName ]
		
]

{ #category : #'as yet unclassified' }
GTPackageProcessor >> originalCollection [

	^ RPackageOrganizer default packageNames
]

{ #category : #'as yet unclassified' }
GTPackageProcessor >> render: aPackage [
		
	^ GTSpotterItemBrick new
		icon: (Smalltalk ui icons iconNamed: #packageIcon);
		text: aPackage name
]

{ #category : #accessing }
GTPackageProcessor >> title [
	^ 'Packages'
]
