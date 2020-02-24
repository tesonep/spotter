"
I wrap a CompiledMethod, to modify its behavior if required for the class
"
Class {
	#name : #SptMethodEntry,
	#superclass : #SptEntry,
	#category : #'GT-Spotter-New-Entries'
}

{ #category : #accessing }
SptMethodEntry >> asString [

	^ content selector
]
