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
			extent: 650@500;
			color: (Smalltalk ui theme baseColor);
			layoutPolicy: (FAbsoluteRelativeLayout new direction: #rightDown);
			yourself ].
]

{ #category : #accessing }
FMorphRenderer >> owner: anObject [
	^ owner ifNil: [ 
		owner := Morph new
			extent: 840@300;
			color: Color gray;
			layoutPolicy: (FAbsoluteRelativeLayout new direction: #rightDown);
			yourself ].
]

{ #category : #rendering }
FMorphRenderer >> render [
	^ self subclassResponsibility 
]

{ #category : #rendering }
FMorphRenderer >> render: aModel selector: aSelector [
	self model: aModel.
	self selector: aSelector.
	^ self render.
]

{ #category : #accessing }
FMorphRenderer >> selector [
	^ selector
]

{ #category : #accessing }
FMorphRenderer >> selector: anObject [
	selector := anObject
]
