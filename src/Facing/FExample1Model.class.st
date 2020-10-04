Class {
	#name : #FExample1Model,
	#superclass : #Object,
	#instVars : [
		'a',
		'b'
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
	b changed: #b.
]

{ #category : #rendering }
FExample1Model >> morphRenderer [
	^ FExample1Renderer new 
	
]
