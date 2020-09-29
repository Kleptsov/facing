Class {
	#name : #FOrder,
	#superclass : #Object,
	#instVars : [
		'vars',
		'varsOrder',
		'model',
		'morph'
	],
	#category : #Facing
}

{ #category : #initialization }
FOrder >> initializeMorph [
	morph := Morph new.
	morph layoutPolicy: (FAbsoluteRelativeLayout new direction: #rightDown).
]

{ #category : #accessing }
FOrder >> morph [
	^  morph ifNil: [ self initializeMorph ]
]

{ #category : #accessing }
FOrder >> morph: anObject [
	morph := anObject
]

{ #category : #rendering }
FOrder >> orderMorph [
	self morph removeAllMorphs.
	self varsOrder reverseDo: [ :v|
		morph addMorph: (self vars at: v ifAbsent: [Morph new])  ].
	^ morph
	
]

{ #category : #rendering }
FOrder >> renderModel: aModel [
	aModel morphRenderer render: aModel order: self
]

{ #category : #updating }
FOrder >> update: aParameter [
	aParameter = #updateAll
		ifTrue: [  ]
]

{ #category : #updating }
FOrder >> update: aParameter with: aModel [
	aParameter = #display
		ifTrue: [ self renderModel: aModel ]
]

{ #category : #accessing }
FOrder >> vars [
	^ vars ifNil: [ vars := IdentityDictionary new ]
]

{ #category : #accessing }
FOrder >> vars: anObject [
	vars := anObject
]

{ #category : #accessing }
FOrder >> varsOrder [
	^ varsOrder ifNil: [ varsOrder := OrderedCollection new ]
]

{ #category : #accessing }
FOrder >> varsOrder: anObject [
	varsOrder := anObject
]
