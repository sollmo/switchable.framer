Framer.Device.background.backgroundColor = "F8C31C"

# Import file "switchable_tabbar"
sketch = Framer.Importer.load("imported/switchable_tabbar@1x")

sketch.toolbar1_bg.style = '-webkit-backdrop-filter':'blur(20px)'

fwidth = Framer.Device.screen.width
fheight = Framer.Device.screen.height

#----------------------------------------------------------------------------- MAP
sketch.map_bg.draggable.enabled = true
sketch.map_bg.draggable.constraints =
	x:-(sketch.map_bg.width-fwidth)
	y:-(sketch.map_bg.height-fheight)
	width: (sketch.map_bg.width*2)-fwidth
	height: (sketch.map_bg.height*2)-fheight

#----------------------------------------------------------------------------- NavBar, Toolbar	
sketch.handler1.draggable.enabled = true
sketch.handler1.draggable.vertical = false
sketch.handler1.draggable.overdrag = false
sketch.handler1.draggable.momentum = false
sketch.handler1.draggable.constraints = 
	x: sketch.toolbar1_bg.x - 25
	y: sketch.toolbar1_bg.y
	width: sketch.toolbar1_bg.width + 25 + 25 
	height: sketch.toolbar1_bg.height

sketch.hand1_arr.originX = 0
sketch.hand2_arr.originX = 1
sketch.title_yellow.opacity = 0
sketch.handler2.opacity = 0
sketch.toolbar2_bg_border.opacity = 0

# i = toolbar1_bg witdh 끝자리 계산 
i = sketch.toolbar1_bg.width + 25 + 25 - sketch.handler1.width

sketch.handler1.on Events.Move, ->
	# navBar title 색상 변경 
	sketch.title_purple.opacity = Utils.modulate(sketch.handler1.x, [0, i], [1, 0], true)
	sketch.title_yellow.opacity = Utils.modulate(sketch.handler1.x, [0, i], [0, 1], true)
	
	# toolbar 
	sketch.handler2.x = Utils.modulate(sketch.handler1.x, [0, i], [0, i], true)
	
	sketch.handler1.opacity = Utils.modulate(sketch.handler1.x, [i*0.4, i*0.6], [1, 0], true)
	sketch.hand1_arr.scaleX = Utils.modulate(sketch.handler1.x, [i*0.4, i*0.6], [1, 0], true)
	
	sketch.handler2.opacity = Utils.modulate(sketch.handler1.x, [i*0.4, i*0.6], [0, 1], true)
	sketch.hand2_arr.scaleX = Utils.modulate(sketch.handler1.x, [i*0.4, i*0.6], [0, 1], true)
	
	sketch.toolbar1_bg_border.opacity = Utils.modulate(sketch.handler1.x, [i*0.4, i*0.6], [1, 0], true)
	sketch.toolbar2_bg_border.opacity = Utils.modulate(sketch.handler1.x, [i*0.4, i*0.6], [0, 1], true)

# 	print sketch.handler1.x
# 	print sketch.handler1.opacity	
	
sketch.handler1.on Events.DragEnd, ->
	if sketch.handler1.x > i*0.5
# 		print "go right"
		sketch.handler1.animate
			x: i
			opacity: 0
			options:
				curve: "spring(400,28,0)"
		sketch.handler2.animate
			x: i
			opacity: 1
			options:
				curve: "spring(400,28,0)"
		sketch.hand2_arr.scaleX = 1
		sketch.toolbar1_bg_border.opacity = 0
		sketch.toolbar2_bg_border.opacity = 1
		sketch.title_purple.opacity = 0
		sketch.title_yellow.opacity = 1
	else
# 		print "go left"
		sketch.handler1.animate
			x: 0
			opacity: 1
			options:
				curve: "spring(400,28,0)"
		sketch.handler2.animate
			x: 0
			opacity: 0
			options: 
				curve: "spring(400,28,0)"
		sketch.hand1_arr.scaleX = 1
		sketch.toolbar1_bg_border.opacity = 1
		sketch.toolbar2_bg_border.opacity = 0
		sketch.title_purple.opacity = 1
		sketch.title_yellow.opacity = 0









