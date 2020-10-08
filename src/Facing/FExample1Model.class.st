Class {
	#name : #FExample1Model,
	#superclass : #Object,
	#instVars : [
		'a',
		'b',
		'c'
	],
	#category : #'Facing-Example'
}

{ #category : #accessing }
FExample1Model >> a [
	^ a ifNil: [ a := '' ]
]

{ #category : #accessing }
FExample1Model >> a: anObject [
	a := anObject.
	self changed: #a.
]

{ #category : #accessing }
FExample1Model >> b [
	^ b ifNil: [ b := '' ]
]

{ #category : #accessing }
FExample1Model >> b: anObject [
	b := anObject.
	self changed: #b.
]

{ #category : #accessing }
FExample1Model >> c [
	^ c ifNil: [ c := '' ]
]

{ #category : #accessing }
FExample1Model >> c: aString [
	c := aString.
	self changed: #c
]

{ #category : #rendering }
FExample1Model >> morphController [
	^ FExample1Controller new
]

{ #category : #rendering }
FExample1Model >> morphRenderer [
	^ FExample1Renderer new.
	
]

{ #category : #rendering }
FExample1Model >> morphView [
	^ self morphController updateModel: self.
	
]

{ #category : #rendering }
FExample1Model >> morphViewInWindow [
	| m w |
	m := self morphView.
	w := StandardWindow new.
	w addMorph: m frame: LayoutFrame new.
	w open.
	^ m
]
