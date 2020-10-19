Class {
	#name : #FExample1Model,
	#superclass : #Object,
	#instVars : [
		'a',
		'b',
		'c',
		'd',
		'e',
		'f'
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
	b := anObject
]

{ #category : #accessing }
FExample1Model >> c [
	^ c ifNil: [ c := '' ]
]

{ #category : #accessing }
FExample1Model >> c: anObject [
	c := anObject
]

{ #category : #accessing }
FExample1Model >> d [
	^ d ifNil: [ d := '' ]
]

{ #category : #accessing }
FExample1Model >> d: anObject [
	d := anObject
]

{ #category : #accessing }
FExample1Model >> e [
	^ e ifNil: [ e := '' ]
]

{ #category : #accessing }
FExample1Model >> e: anObject [
	e := anObject
]

{ #category : #accessing }
FExample1Model >> f [
	^ f ifNil: [ f := '' ]
]

{ #category : #accessing }
FExample1Model >> f: anObject [
	f := anObject
]
