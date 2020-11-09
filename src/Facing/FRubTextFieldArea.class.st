Class {
	#name : #FRubTextFieldArea,
	#superclass : #RubEditingArea,
	#instVars : [
		'selector',
		'isChanging'
	],
	#category : #'Facing-Morphs'
}

{ #category : #'as yet unclassified' }
FRubTextFieldArea >> defaultMargins [

	^ Margin left: 1 right: 1 top: 1 bottom: 1
]

{ #category : #initialize }
FRubTextFieldArea >> initialize [
	super initialize.
	
]

{ #category : #accessing }
FRubTextFieldArea >> isChanging [
	^ isChanging ifNil: [ isChanging := false ].
]

{ #category : #accessing }
FRubTextFieldArea >> isChanging: aBoolean [
	isChanging := aBoolean.
]

{ #category : #accessing }
FRubTextFieldArea >> model: aModel [
	super model: aModel.
	model ifNil: [ ^ self ].
	model addDependent: self.
	self announcer when: RubTextChanged do: [ :a|
		self isChanging: true.		
		model perform: (self selector, #':') with: editor text string.
		self isChanging: false. ].
	selector ifNotNil: [model changed: selector].
]

{ #category : #accessing }
FRubTextFieldArea >> selector [
	^ (selector ifNil: [ #yourself ]) asSymbol
]

{ #category : #accessing }
FRubTextFieldArea >> selector: anObject [
	selector := anObject.
	model ifNotNil: [ model changed: selector ].
]

{ #category : #accessing }
FRubTextFieldArea >> update: aSelector [
	aSelector = selector
		ifFalse: [ ^ self ].
	self isChanging
		ifTrue: [ ^ self ].
	self updateTextWith: (model perform: aSelector asSymbol) asString.
]

{ #category : #accessing }
FRubTextFieldArea >> update: aSelector with: anObject [
	anObject = #forcibly ifFalse: [ 
		aSelector = selector ifFalse: [ ^ self ].
		self isChanging ifTrue: [ ^ self ] ].
	self updateTextWith: (model perform: aSelector asSymbol) asString.
]
