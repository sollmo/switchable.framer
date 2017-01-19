# Import file "switchable_tabbar"
sketch = Framer.Importer.load("imported/switchable_tabbar@1x")

sketch.toolbar1_bg.style = '-webkit-backdrop-filter':'blur(20px)'

fwidth = Framer.Device.screen.width
fheight = Framer.Device.screen.height

sketch.map_bg.draggable.enabled = true
sketch.map_bg.draggable.constraints =
	x:-(sketch.map_bg.width-fwidth)
	y:-(sketch.map_bg.height-fheight)
	width: (sketch.map_bg.width*2)-fwidth
	height: (sketch.map_bg.height*2)-fheight

sketch.handler1.draggable.enabled = true
sketch.handler1.draggable.vertical = false
sketch.handler1.draggable.overdrag = false
sketch.handler1.draggable.momentum = false
sketch.handler1.draggable.constraints = 
	x: sketch.toolbar1_bg.x
	y: sketch.toolbar1_bg.y
	width: sketch.toolbar1_bg.width + 24
	height: sketch.toolbar1_bg.height