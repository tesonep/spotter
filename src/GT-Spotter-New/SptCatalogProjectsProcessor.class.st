Class {
	#name : #SptCatalogProjectsProcessor,
	#superclass : #SptCollectionBasedProcessor,
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #'default-settings' }
SptCatalogProjectsProcessor class >> defaultEnabled [

	^ false
]

{ #category : #accessing }
SptCatalogProjectsProcessor class >> order [
	
	^ 90
]

{ #category : #accessing }
SptCatalogProjectsProcessor class >> title [

	^ 'Catalog Projects'
]

{ #category : #filtering }
SptCatalogProjectsProcessor >> collection [

	^ CatalogProvider default projects
]

{ #category : #filtering }
SptCatalogProjectsProcessor >> newEntryOn: anElement [

	^ SptCatalogProjectEntry on: anElement
]
