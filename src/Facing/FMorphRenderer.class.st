Class {
	#name : #FMorphRenderer,
	#superclass : #Object,
	#instVars : [
		'owner',
		'model',
		'selector'
	],
	#category : #'Facing-Core'
}

{ #category : #accessing }
FMorphRenderer >> model [
	^ model
]

{ #category : #accessing }
FMorphRenderer >> model: anObject [
	model := anObject
]

{ #category : #accessing }
FMorphRenderer >> owner [
	^ owner ifNil: [ 
		owner := Morph new
			extent: 100@40;
			color: Color transparent;
			layoutPolicy: (FAbsoluteRelativeLayout new direction: #rightDown);
			hResizing: #spaceFill;
			yourself ]
]

{ #category : #rendering }
FMorphRenderer >> render [
	^ self subclassResponsibility 
]

{ #category : #rendering }
FMorphRenderer >> render: aSelectorOrMorph [
	| morph |
	morph := aSelectorOrMorph isMorph
		ifTrue: [ aSelectorOrMorph ]
		ifFalse: [ (model perform: aSelectorOrMorph) morphController
				listen: aSelectorOrMorph
				from: model ].
	self owner addMorphBack: morph.
	^ morph
]

{ #category : #rendering }
FMorphRenderer >> render: aModel selector: aSelector [
	self model: aModel.
	self selector: aSelector.
	^ self render.
]

{ #category : #rendering }
FMorphRenderer >> render: aSelectorOrMorph with: aMorphBehavior [
	| morph controller |
	morph := aSelectorOrMorph isMorph
		ifTrue: [ aSelectorOrMorph ]
		ifFalse: [ controller := (model perform: aSelectorOrMorph) morphController.
			morph := controller listen: aSelectorOrMorph from: model.
			controller morphBehavior: aMorphBehavior.
			aMorphBehavior value: morph. ].
	self owner addMorphBack: morph.
	^ morph.
]

{ #category : #rendering }
FMorphRenderer >> render: aSelector with: aMorphBehavior finalize: aMorphFinalyze [
	| m c |
	c := (model perform: aSelector) morphController.
	m := c listen: aSelector from: model.
	c morphBehavior: aMorphBehavior.
	c morphFinalize: aMorphFinalyze.
	aMorphBehavior value: m.
	self owner addMorphBack: m.
	^ m.
]

{ #category : #accessing }
FMorphRenderer >> selector [
	^ selector
]

{ #category : #accessing }
FMorphRenderer >> selector: anObject [
	selector := anObject
]
