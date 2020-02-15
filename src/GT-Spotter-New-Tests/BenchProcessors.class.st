Class {
	#name : #BenchProcessors,
	#superclass : #Object,
	#category : #'GT-Spotter-New-Tests'
}

{ #category : #benchmarking }
BenchProcessors >> benchClassFinding [
	<script: 'self new benchClassFinding'>

	| numberOfClasses |
	
	numberOfClasses := SystemNavigation default allBehaviors size.

	(String streamContents: [ :aStream |
		aStream 
			<< 'Classes'; cr;
			<< '-------'; cr;
			cr;
			<< 'Total Classes:';
			print: numberOfClasses;
			cr;cr.

		self runClassBenchMarksFor: 'znu' resultsInto: aStream.	
		self runClassBenchMarksFor: 'ast' resultsInto: aStream.	
		self runClassBenchMarksFor: 'gtspotter' resultsInto: aStream.	
		self runClassBenchMarksFor: 'test' resultsInto: aStream.	
	]) inspect.

]

{ #category : #benchmarking }
BenchProcessors >> contextForText: aString [

	| candidates stream |

	candidates := GTMockCandidatesList new.
	stream := GTMockSpotterStream new
		receiver: candidates;
		yourself.

	^ GTSpotterContext new 
		step: self;
		stream: stream;
		text: aString;
		search: aString;
		yourself.

	
]

{ #category : #benchmarking }
BenchProcessors >> newClassProcessor [

	^ GTClassProcessor new
]

{ #category : #benchmarking }
BenchProcessors >> oldClassProcessor [

	^ GTSpotterCandidatesListProcessor new
			allCandidates: [ Smalltalk allClassesAndTraits ];
			title: 'Classes';
			filter: GTFilterFuzzy;
			itemIcon: #systemIcon;
			keyBinding: $b meta;
			wantsToDisplayOnEmptyQuery: false;
			yourself.

]

{ #category : #benching }
BenchProcessors >> runClassBenchMarksFor: aString resultsInto: aWriteStream [ 
	| context oldProcessor newProcessor oldBench newBench |
	
	context := self contextForText: aString.
	oldProcessor := self oldClassProcessor.
	oldBench := [oldProcessor filterInContext: context] bench.

	context := self contextForText: aString.
	newProcessor := self newClassProcessor.
	newBench := [newProcessor filterInContext: context] bench.

	aWriteStream
			<< 'Searching:';
			print: aString; tab; tab; tab;
			<< 'Old Implementation:'; 
			<< oldBench; tab;	
			<< 'new Implementation:'; 
			<< newBench; cr.

]
