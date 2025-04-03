class_name SetShaderAction
extends ActionLeaf

@export var material : ShaderMaterial

func before_run(actor: Node, _blackboard: Blackboard) -> void:
	actor.sprite.material = material
