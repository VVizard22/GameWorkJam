extends GridContainer

onready var slots = self.get_children()

func _ready():
	Inventario.connect("nuevoInventario", self, "_on_nuevoInventario")
	Inventario.connect("combineItems", self, "_on_combineItems")

func _on_nuevoInventario():
	for key in Inventario.inventario:
		var useSlot = Inventario.inventario.keys().find(key)
		slots[useSlot].name = key
		slots[useSlot].texture = Inventario.inventario[key]

func _on_combineItems():
	for item in slots:
		if Inventario.inventario.keys().find(item) == -1:
			item.name = "Slot"
			item.texture = null

