Class {
	#name : #FExample1Renderer,
	#superclass : #Object,
	#instVars : [
		'ownerMorph',
		'model'
	],
	#category : #'Facing-Example'
}

{ #category : #rendering }
FExample1Renderer >> closeButtonMorph [
	^ PluggableButtonMorph
		on: nil
		getState: nil
		action:  [ self ownerMorph delete ]"#action "
		label: 'close'"#label"
		menu: nil. 	
]

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
	a := FLabeledText on: aModel label: 'a' selector: #a.
	b := FLabeledText on: aModel label: 'b' selector: #c.
	b extent: 250@60; hResizing: #spaceFill.
	c := FLabeledText on: aModel label: 'c' selector: #a.
	d := FLabeledText on: aModel label: 'd' selector: #c.
	e := FLabeledText on: aModel label: 'e' selector: #b.
	f := FLabeledText on: aModel label: 'f' selector: #b.
	self ownerMorph addMorphBack: a; addMorphBack: b; addMorphBack: c; addMorphBack: d; addMorphBack: e; addMorphBack: f.
	^ ownerMorph.
]
