Class {
	#name : #FExample1Renderer,
	#superclass : #Object,
	#instVars : [
		'ownerMorph',
		'model'
	],
	#category : #'Facing-Example'
}

{ #category : #accessing }
FExample1Renderer >> model [
	^ model
]

{ #category : #accessing }
FExample1Renderer >> model: anObject [
	model := anObject
]

{ #category : #rendering }
FExample1Renderer >> ownerMorph [
	^ ownerMorph ifNil: [ 
		ownerMorph := Morph new
			extent: 840@300;
			layoutPolicy: (FAbsoluteRelativeLayout new direction: #rightDown);
			yourself ].
]

{ #category : #rendering }
FExample1Renderer >> render: aModel selector: aSelector [
	| a b c d e f |
	self model: aModel.
	a := FText on: aModel label: 'a' selector: #a.
	b := FText on: aModel label: 'b' selector: #c.
	b extent: 250@60; hResizing: #spaceFill.
	c := FText on: aModel label: 'c' selector: #a.
	d := FText on: aModel label: 'd' selector: #c.
	e := FText on: aModel label: 'e' selector: #b.
	f := FText on: aModel label: 'f' selector: #b.
	self ownerMorph addMorphBack: a; addMorphBack: b; addMorphBack: c; addMorphBack: d; addMorphBack: e; addMorphBack: f.
	^ ownerMorph.
]
