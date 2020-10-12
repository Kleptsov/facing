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
