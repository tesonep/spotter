"
I am simple processor that iterates on the packages in the system
"
Class {
	#name : #SptPackageProcessor,
	#superclass : #SptSpotterProcessor,
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #'default-settings' }
SptPackageProcessor class >> defaultEnabled [

	^ false
]

{ #category : #filtering }
SptPackageProcessor >> newTextFilteringSource [

	^ (SptPackageIterator new collect: [ :e | SptClassEntry on: e ]) asSubstringFilter
]

{ #category : #accessing }
SptPackageProcessor >> order [
	
	^ 10
]

{ #category : #accessing }
SptPackageProcessor >> title [
	^ 'Packages'
]
