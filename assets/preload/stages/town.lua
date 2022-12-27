local animSh = {'shootbf left','shootbf right'}
function onCreate()
	
	makeLuaSprite('bgBack', 'bgBack', -4000, -1000);
	setScrollFactor('bgBack', 0.3, 0.3);
	
	makeAnimatedLuaSprite('bg', 'bg', -2300, -450);
	addAnimationByPrefix('bg', 'bg', 'bg', 24, true);
	
	makeAnimatedLuaSprite('railway', 'railway', -1500, 20);
	addAnimationByPrefix('railway', 'railway', 'railway', 24, true);
	
	makeLuaSprite('cart_bottom', 'cart_bottom', 1000, 60);
	setScrollFactor('cart_bottom', 1.0, 1.0);
	
	makeLuaSprite('cart_top', 'cart_top', 1000, 60);
	setScrollFactor('cart_top', 1.0, 1.0);
	
	makeAnimatedLuaSprite('railway2', 'railway2', -1750, 300);
	addAnimationByPrefix('railway2', 'railway2', 'railway2', 24, true);
	
	makeLuaSprite('cart_bottom2', 'cart_bottom2', 320, 340);
	setScrollFactor('cart_bottom2', 1.0, 1.0);
	
	makeLuaSprite('cart_top2', 'cart_top2', 320, 340);
	setScrollFactor('cart_top2', 1.0, 1.0);
	
	makeLuaSprite('speaker_cart', 'speaker_cart', 600, -330);
	setScrollFactor('speaker_cart', 1.0, 1.0);
	
	scaleObject('bgBack', 2, 2);
	scaleObject('bg', 1.2, 1.2);
	addLuaSprite('bgBack', false);
	addLuaSprite('bg', false);
	addLuaSprite('railway', false);
	addLuaSprite('speaker_cart', false);
	
	addLuaSprite('railway2', false);
	addLuaSprite('cart_bottom2', false);
	makeAnimatedLuaSprite('shootbf','characters/shootbf',0,0)
	for i = 1,2 do addAnimationByPrefix('shootbf', animSh[i], animSh[i], 24, false) end
	setObjectCamera('shootbf', 'camGame');
	setProperty('shootbf.visible',false)
	addLuaSprite('shootbf', true)
	addLuaSprite('cart_top2', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end