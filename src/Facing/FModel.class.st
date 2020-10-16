Class {
	#name : #FModel,
	#superclass : #Object,
	#category : #'Facing-Model'
}

{ #category : #rendering }
FModel >> morphController [
	^ FDirectController new
]

{ #category : #rendering }
FModel >> morphRenderer [
	^ self subclassResponsibility
]

{ #category : #rendering }
FModel >> morphView [
	^ self subclassResponsibility
]

{ #category : #rendering }
FModel >> morphViewInWindow [
	| m w |
	m := self morphView.
	w := StandardWindow new.
	w addMorph: m frame: LayoutFrame new.
	w open.
	^ m
]
