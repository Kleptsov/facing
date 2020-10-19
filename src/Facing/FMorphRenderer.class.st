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

{ #category : #rendering }
FMorphRenderer >> render [
	^ self subclassResponsibility 
]

{ #category : #rendering }
FMorphRenderer >> render: aSelector [
	| m |
	m := (model perform: aSelector) morphController
					listen: aSelector from: model.
	self owner addMorphBack: m.
	^ m.
]

{ #category : #rendering }
FMorphRenderer >> render: aModel selector: aSelector [
	self model: aModel.
	self selector: aSelector.
	^ self render.
]

{ #category : #rendering }
FMorphRenderer >> render: aSelector with: aMorphBehavior [
	| m c |
	c := (model perform: aSelector) morphController.
	m := c listen: aSelector from: model.
	c morphBehavior: aMorphBehavior.
	aMorphBehavior value: m.
	self owner addMorphBack: m.
	^ m.
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
