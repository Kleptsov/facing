Class {
	#name : #FTextModel,
	#superclass : #FModel,
	#instVars : [
		'val'
	],
	#category : #'Facing-Model'
}

{ #category : #rendering }
FTextModel >> morphController [
	^ FDirectController new
]

{ #category : #rendering }
FTextModel >> morphRenderer [
	^ FTextModelRenderer new
]

{ #category : #accessing }
FTextModel >> val [
	^ val ifNil: [ val := '' ]
]

{ #category : #accessing }
FTextModel >> val: anObject [
	val := anObject.
	self changed: #val.
]
