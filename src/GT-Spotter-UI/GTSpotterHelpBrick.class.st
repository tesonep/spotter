Class {
	#name : #GTSpotterHelpBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'label'
	],
	#category : #'GT-Spotter-UI-Widgets'
}

{ #category : #initialization }
GTSpotterHelpBrick >> anotherSuggestion [

	| suggestion |
	suggestion := {
		'Meta + n filters for Classes'.
		'Meta + m filters for Implementros'.
		'Meta + h filters for Help topics'.
		'Adding #Classes in the query filters for Classes'.
		'Adding #Implementors in the query filters for Implementros'.
		'Adding #Help in the query filters for Help Topics'.
		'Adding #Packages in the query filters for Packages'.
		'Adding #Menu in the query filters for System Menu entries'.
	} atRandom.
	
	[label text = suggestion] 
		whileTrue: [ ^ self anotherSuggestion ].
	
	label text: suggestion.
]

{ #category : #initialization }
GTSpotterHelpBrick >> color: aColor [

	super color: aColor.
	label color: aColor.
]

{ #category : #initialization }
GTSpotterHelpBrick >> initialize [

	| btn |
	super initialize.
	label := GLMLabelBrick new
		color: Color lightBlue;
		textPosition: #left;
		hSpaceFill;
		vSpaceFill;
		marginTop: 2;		
		marginLeft: 5.
		
	self anotherSuggestion.

	self
		hSpaceFill;
		vSpaceFill.

	self addBrickBack: label.
	
	btn := GLMHintableActionButtonBrick new
		vSpaceFill;
		width: [ :m | m height ];
		margin: 0;
		hintTitle: 'Show me';
		hintText: 'another suggestion.';
		normalImage: (self theme icons iconNamed: #glamorousHelp);
		action: [ self anotherSuggestion ]
		yourself.
	
	self addBrickBack: btn

]
