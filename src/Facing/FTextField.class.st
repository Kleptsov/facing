Class {
	#name : #FTextField,
	#superclass : #PluggableTextFieldMorph,
	#category : #'Facing-Morphs'
}

{ #category : #creating }
FTextField class >> on: aModel text: aTextSelector accept: anAcceptSelector acceptAction:  anAcceptAction [
	| txtMorph |
	txtMorph := PluggableTextFieldMorph new.
	txtMorph on: aModel text: aTextSelector accept: anAcceptSelector readSelection: nil menu: nil.
	txtMorph autoAccept: true.
	txtMorph acceptAction: anAcceptAction.
	txtMorph hideVScrollBarIndefinitely: true.
	^ txtMorph yourself.
]
