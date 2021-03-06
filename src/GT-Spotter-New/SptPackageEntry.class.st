"
I wrap a RPackage entry, to modify its behavior if required for the class
"
Class {
	#name : #SptPackageEntry,
	#superclass : #SptEntry,
	#category : #'GT-Spotter-New-Entries'
}

{ #category : #converting }
SptPackageEntry >> asString [

	^ content name
]

{ #category : #evaluating }
SptPackageEntry >> doEvaluate [

	content browse
]

{ #category : #showing }
SptPackageEntry >> icon [
	^ Smalltalk ui theme iconNamed: #package
]
