Class {
	#name : #SptPackageEntry,
	#superclass : #SptEntry,
	#category : #'GT-Spotter-New-Entries'
}

{ #category : #accessing }
SptPackageEntry >> asString [

	^ content name
]

{ #category : #accessing }
SptPackageEntry >> doEvaluate [

	content browse
]

{ #category : #accessing }
SptPackageEntry >> render [ 

	^ GTSpotterItemBrick new
		icon: (Smalltalk ui theme iconNamed: #package);
		text: content name
]
