Class {
	#name : #FExample1Renderer,
	#superclass : #Object,
	#instVars : [
		'model',
		'order'
	],
	#category : #'Facing-Example'
}

{ #category : #accessing }
FExample1Renderer >> model [
	^ model
]

{ #category : #accessing }
FExample1Renderer >> model: anObject [
	model := anObject
]

{ #category : #accessing }
FExample1Renderer >> order [
	^ order
]

{ #category : #accessing }
FExample1Renderer >> order: anObject [
	order := anObject
]

{ #category : #rendering }
FExample1Renderer >> render [
	| a b |
	a := [ FLabeledText on: model label: 'a' selector: #a ].
	order at: #a put: a.
	b := [ FLabeledText on: model label: 'b' selector: #b ].
	order at: #b put: b.
	order at: #c put: a.
	order at: #d put: b.
]

{ #category : #rendering }
FExample1Renderer >> render: aModel order: anOrder [
	model := aModel.
	order := anOrder.
	self render.
]
