"
I am simple processor that iterates on the packages in the system
"
Class {
	#name : #SptPackageProcessor,
	#superclass : #SptSpotterProcessor,
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #filtering }
SptPackageProcessor >> newTextFilteringSource [

	^ (SptPackageIterator new collect: [ :e | SptClassEntry on: e ]) asSubstringFilter
]

{ #category : #accessing }
SptPackageProcessor >> title [
	^ 'Packages'
]
