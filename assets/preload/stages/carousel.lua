
function onCreate()
	makeLuaSprite('jevil_shadow', 'jevil_shadow', -190, 600);
	addLuaSprite('jevil_shadow', true);
	
	makeAnimatedLuaSprite('carousel', 'carousel', -1150, -1300);
	addAnimationByPrefix('carousel', 'carousel1', 'carousel', 34, true);
	scaleObject('carousel', 4, 4);
	addLuaSprite('carousel', false);
	setProperty('jevil_shadow.alpha',0.6)
	objectPlayAnimation('carousel','caraousel1',true)

end

function onCreatePost()
	setProperty('dad.alpha',0)
	setProperty('camHUD.alpha',0)
	setProperty('camFollowPos.x',getProperty('gf.x')+200)
	setProperty('camFollowPos.y',getProperty('gf.y')+220)
	runTimer('startC',0.8)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startC' then -- Timer completed, play dialogue
		runTimer('lmaofxd', 0.4);
        setProperty('dad.alpha',1)
        characterPlayAnim('dad','intro',true)
        runTimer('playel',0.3)
	end
    if tag == 'playel' then
        characterPlayAnim('dad','idle',true)
    end
    if tag == 'lmaofxd' then
		doTweenAlpha('blablae','camHUD',1,0.5,'quadOut')
    end
end