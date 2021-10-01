Class {
	#name : #FMorphTreeModel,
	#superclass : #MorphTreeModel,
	#instVars : [
		'columns',
		'treeMorphBlock',
		'selectAction'
	],
	#category : #'Facing-Model'
}

{ #category : #'column handling' }
FMorphTreeModel >> columnLabel: aLabel selector: aSelector [
	^ self columnLabel: aLabel selector: aSelector morph: [ :val|
		val asString asMorph ]
]

{ #category : #'column handling' }
FMorphTreeModel >> columnLabel: aLabel selector: aSelector morph: aBlock [
	| c val |
	c := MorphTreeColumn new.
	c 	headerButtonLabel: aLabel font: nil;
		rowMorphGetSelector: [ :n|
			val := (aSelector class = BlockClosure)
				ifTrue: [ aSelector value: n item ]
				ifFalse: [ n item perform: aSelector ].
			aBlock cull: val cull: c ].
	self columns add: c.
	^ c.
]

{ #category : #accessing }
FMorphTreeModel >> columns [
	^ columns ifNil: [ columns := OrderedCollection new ]
]

{ #category : #accessing }
FMorphTreeModel >> columns: anObject [
	columns := anObject
]

{ #category : #initialization }
FMorphTreeModel >> initializeSelection: anAnnouncer [
	anAnnouncer
		when: MorphTreeSelectionChanged
		do: [ :a | (a selection lastSelectedNode) ifNotNil: [ :n| self selectAction cull: n item ] ]
]

{ #category : #rendering }
FMorphTreeModel >> morphController [
	^ FDirectController new.
]

{ #category : #rendering }
FMorphTreeModel >> morphRenderer [
	^ FMorphTreeRenderer new.
]

{ #category : #rendering }
FMorphTreeModel >> morphView [
	^ self morphController
			listen: #yourself from: self.
]

{ #category : #rendering }
FMorphTreeModel >> morphViewInWindow [
	| m w |
	m := self morphView.
	w := StandardWindow new.
	w title: 'Tree Morph'.
	w addMorph: m frame: LayoutFrame new.
	w open.
	^ m
]

{ #category : #accessing }
FMorphTreeModel >> selectAction [
	^ selectAction ifNil: [ selectAction := [ :v| ] ]
]

{ #category : #accessing }
FMorphTreeModel >> selectAction: aBlock [
	selectAction := aBlock.
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
			"keystrokeActionSelector: #keyStroke:;"
			"preferedPaneColor: Color white;"
			"multiSelection: self multiSelection;
			autoMultiSelection: self autoMultiSelection;"
			"itemStringGetter: [:item | self wrapItem: item];"
			isCheckList: self isCheckList.
	self treeMorphBlock value: tm.
	tm buildContents.
	self initializeSelection: tm announcer.
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
