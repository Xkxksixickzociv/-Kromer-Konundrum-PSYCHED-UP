local isTheSong = false
function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bfdead'); --Character json file for the death animation
	if songName == '[NEO]' then
		makeAnimatedLuaSprite('gameStart','battlestart',0,0)
		addAnimationByPrefix('gameStart','start','battlestart idle',24,false)
		screenCenter('gameStart', 'xy')
		addLuaSprite('gameStart', true)
		setObjectCamera('gameStart', 'hud')
		setProperty('gameStart.alpha',0)
		isTheSong = true
	elseif songName == 'Bigshot' then
		makeAnimatedLuaSprite('gameStart','battlestart',0,0)
		addAnimationByPrefix('gameStart','start','battlestart idle',24,false)
		screenCenter('gameStart', 'xy')
		addLuaSprite('gameStart', true)
		setObjectCamera('gameStart', 'hud')
		setProperty('gameStart.alpha',0)
		isTheSong = true
	end
end
local doneShit = false
function onCountdownTick(counter) -- le epic startdown COunt Lets goooo
if isTheSong == true then
	if counter == 1 then
		doTweenAlpha('started','gameStart',1,0.2,'circInOut')
		objectPlayAnimation('gameStart','start',true)
	elseif counter == 0 then
		playSound('battleStart',1,'startedlol')
	end
end
if counter == 4 then
	doneShit = true
end
end
function onSoundFinished(tag)
	if isTheSong then
	if tag == 'startedlol' then
		doTweenAlpha('started','gameStart',0,0.2,'circInOut')
		doneshit = true
	end
end
end

function onUpdatePost()
	if doneShit == false then  -- why tho i make this 
	setProperty('introSoundsSuffix', 'muted')
	setProperty('countdownReady.visible', false)
	setProperty('countdownSet.visible', false)
	setProperty('countdownGo.visible', false)
	end
end