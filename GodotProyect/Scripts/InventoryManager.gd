extends GridContainer

onready var slots = self.get_children()
var hover = false

func _on_Area2D_mouse_entered():
	hover = true

func _on_Area2D_mouse_exited():
	hover = false

func deleteSlot(slot):
	slot.queue_free()
	
func newSlot():
	load("ress://Scenes/Inventario/Slot.tscn")

func _ready():
	Inventario.connect("nuevoInventario", self, "_on_nuevoInventario")
	Inventario.connect("eliminar", self, "borrarItems")

func _on_nuevoInventario():
	for items in slots:
		items.name = "slot"
		items.get_child(0).get_child(0).name = "Slot"
		items.get_child(0).get_child(0).texture = null
	for key in Inventario.inventario:
		var useSlot = Inventario.inventario.keys().find(key)
		slots[useSlot].get_child(0).get_child(0).name = key
		slots[useSlot].name = key
		slots[useSlot].get_child(0).get_child(0).texture = Inventario.inventario[key]


func borrarItems(item):
	for items in slots:
		if items.name == item:
			Inventario.inventario.erase(item)
			items.get_child(0).get_child(0).texture = null

