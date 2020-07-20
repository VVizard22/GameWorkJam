extends GridContainer

onready var slots = self.get_children()

func _ready():
	Inventario.connect("nuevoInventario", self, "_on_nuevoInventario")

func _on_nuevoInventario():
	for key in Inventario.inventario:
		var useSlot = Inventario.inventario.keys().find(key)
		slots[useSlot].name = key
		slots[useSlot].texture = Inventario.inventario[key]
