Class {
	#name : #FTextField,
	#superclass : #RubPluggableTextFieldMorph,
	#category : #'Facing-Morphs'
}

{ #category : #creating }
FTextField class >> on: aModel selector: aSelector [
	^ self on: aModel selector: aSelector acceptAction: nil
]

{ #category : #creating }
FTextField class >> on: aModel selector: aSelector acceptAction: anAction [
	^ self on: aModel text: aSelector accept: aSelector,':' acceptAction: anAction
]

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
