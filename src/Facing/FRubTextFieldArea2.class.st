Class {
	#name : #FRubTextFieldArea2,
	#superclass : #RubEditingArea,
	#instVars : [
		'selector',
		'isChanging'
	],
	#category : #'Facing-Morphs'
}

{ #category : #'as yet unclassified' }
FRubTextFieldArea2 >> defaultMargins [

	^ Margin left: 1 right: 1 top: 1 bottom: 1
]

{ #category : #initialize }
FRubTextFieldArea2 >> initialize [
	super initialize.
	self announcer when: RubTextChanged do: [ :a|
		self isChanging ifFalse: [.		
			self sEvent: #updateText arg: editor text string ] ].
	
]

{ #category : #accessing }
FRubTextFieldArea2 >> isChanging [
	^ isChanging ifNil: [ isChanging := false ].
]

{ #category : #accessing }
FRubTextFieldArea2 >> isChanging: aBoolean [
	isChanging := aBoolean.
]

{ #category : #accessing }
FRubTextFieldArea2 >> selector [
	^ (selector ifNil: [ #yourself ]) asSymbol
]

{ #category : #accessing }
FRubTextFieldArea2 >> selector: anObject [
	selector := anObject.
	model ifNotNil: [ model changed: selector ].
]

{ #category : #accessing }
FRubTextFieldArea2 >> source: aModel selector: aSelector [
	super model: aModel.
	selector := aSelector.
	model ifNil: [ ^ self ].
	model addEvent: #updateText: receiver: self.
	self addEvent: aSelector asSymbol receiver: model.
	self announcer when: RubTextChanged do: [ :a|
		self isChanging: true.		
		self sEvent: aSelector asSymbol arg: editor text string.
		self isChanging: false. ].
	selector ifNotNil: [model sEvent: #updateText arg: (model perform: selector)].
]

{ #category : #accessing }
FRubTextFieldArea2 >> updateText: aText [
	(aText asString = editor text string)
		ifTrue: [ ^ self ].
	self isChanging: true.
	self updateTextWith:"privateText" aText.
	self isChanging: false.
]
