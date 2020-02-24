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

	label text: (String loremIpsum: 50)
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
		marginLeft: 5;		
		text: 'asdasds'.

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
		normalImage: (self theme icons iconNamed: #glamorousRefresh);
		action: [ self anotherSuggestion ]
		yourself.
	
	self addBrickBack: btn

]
