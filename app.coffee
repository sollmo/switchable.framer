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

# handler animation 관련, 초기 셋업
sketch.hand1_arr.originX = 0
sketch.hand2_arr.originX = 1
sketch.title_yellow.opacity = 0
sketch.handler2.opacity = 0
sketch.toolbar2_bg_border.opacity = 0

# ic_05~08까지, sketch에서 감춰뒀기 때문에  visible true로 변경하고, opacity 0으로 셋팅.
j = 5
while j <= 8
  eval 'sketch.ic_0' + j + ".visible = true"
  eval 'sketch.ic_0' + j + ".opacity = 0"
  j++

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

	sketch.ic_05.opacity = Utils.modulate(sketch.handler1.x, [60, 80], [0, 1], true)
	sketch.ic_06.opacity = Utils.modulate(sketch.handler1.x, [180, 200], [0, 1], true)
	sketch.ic_07.opacity = Utils.modulate(sketch.handler1.x, [320, 340], [0, 1], true)
	sketch.ic_08.opacity = Utils.modulate(sketch.handler1.x, [440, 460], [0, 1], true)

	sketch.ic_01.opacity = Utils.modulate(sketch.handler1.x, [120, 160], [1, 0], true)
	sketch.ic_02.opacity = Utils.modulate(sketch.handler1.x, [260, 320], [1, 0], true)
	sketch.ic_03.opacity = Utils.modulate(sketch.handler1.x, [400, 460], [1, 0], true)
	sketch.ic_04.opacity = Utils.modulate(sketch.handler1.x, [520, 570], [1, 0], true)
	
	
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
		
		sketch.ic_01.opacity = 0
		sketch.ic_02.opacity = 0
		sketch.ic_03.opacity = 0
		sketch.ic_04.opacity = 0
		sketch.ic_05.opacity = 1
		sketch.ic_06.opacity = 1
		sketch.ic_07.opacity = 1
		sketch.ic_08.opacity = 1
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
		
		sketch.ic_01.opacity = 1
		sketch.ic_02.opacity = 1
		sketch.ic_03.opacity = 1
		sketch.ic_04.opacity = 1
		sketch.ic_05.opacity = 0
		sketch.ic_06.opacity = 0
		sketch.ic_07.opacity = 0
		sketch.ic_08.opacity = 0









