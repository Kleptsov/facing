Class {
	#name : #FButton,
	#superclass : #PluggableButtonMorph,
	#category : #'Facing-Morphs'
}

{ #category : #creating }
FButton class >> label: aLabel action: anAction [
	^ self
			newButtonFor: nil
			action: anAction
			label: aLabel
			help: aLabel asString
]

{ #category : #creating }
FButton class >> label: aLabel action: anAction help: aHelpString [
	^ self
			newButtonFor: nil
			action: anAction
			label: aLabel
			help: aHelpString
]

{ #category : #creating }
FButton class >> model: aModel label: aLabel action: anAction [
	^ self
			newButtonFor: aModel
			action: anAction
			label: aLabel
			help: aLabel asString
]
