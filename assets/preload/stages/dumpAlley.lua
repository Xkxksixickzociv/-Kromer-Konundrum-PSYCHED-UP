function onCreate()


makeLuaSprite('dumpAlley', 'dumpAlley', -500, -300);
makeAnimatedLuaSprite('trash', 'garbage-can', 400, -110);
addAnimationByPrefix('trash','idle','garbage-can',24,true)
setScrollFactor('dumpAlley', 1.0, 1.0);
	

addLuaSprite('dumpAlley', false);
addLuaSprite('trash',false)
	
end