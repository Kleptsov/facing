Class {
	#name : #FMorphRenderer,
	#superclass : #Object,
	#instVars : [
		'owner',
		'model'
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
			color: (Color r: 0.95 g: 0.95 b: 0.85);
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
