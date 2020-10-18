Class {
	#name : #FMorphTreeModel,
	#superclass : #MorphTreeModel,
	#instVars : [
		'columns',
		'treeMorphBlock'
	],
	#category : #'Facing-Morphs'
}

{ #category : #'column handling' }
FMorphTreeModel >> columnLabel: aLabel selector: aSelector [
	self columnLabel: aLabel selector: aSelector morph: [ :val|
		val asString asMorph ]
]

{ #category : #'column handling' }
FMorphTreeModel >> columnLabel: aLabel selector: aSelector morph: aBlock [
	| c val |
	c := MorphTreeColumn new.
	c 	headerButtonLabel: aLabel font: nil;
		rowMorphGetSelector: [ :n|
			val := n item perform: aSelector.
			aBlock cull: val cull: c ].
	self columns add: c.
]

{ #category : #accessing }
FMorphTreeModel >> columns [
	^ columns ifNil: [ columns := OrderedCollection new ]
]

{ #category : #accessing }
FMorphTreeModel >> columns: anObject [
	columns := anObject
]

{ #category : #'column handling' }
FMorphTreeModel >> treeMorph [
	| tm |
	tm := self treeMorphClass on: self.		
	tm
			columns:  self columns asArray;
			"hResizing: #spaceFill;
			vResizing: #spaceFill;"
			resizerWidth: 2;
			columnInset: 4; 
			rowInset: 4; 
			keystrokeActionSelector: #keyStroke:;
			"preferedPaneColor: Color white;"
			"multiSelection: self multiSelection;
			autoMultiSelection: self autoMultiSelection;"
			"itemStringGetter: [:item | self wrapItem: item];"
			isCheckList: self isCheckList.
	self treeMorphBlock value: tm.
	tm buildContents.
	^ tm
]

{ #category : #accessing }
FMorphTreeModel >> treeMorphBlock [
	^ treeMorphBlock ifNil: [ treeMorphBlock := [ :v| ] ]
]

{ #category : #accessing }
FMorphTreeModel >> treeMorphBlock: aBlock [
	treeMorphBlock := aBlock
]
