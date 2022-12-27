local adsCount = 1
local anims = {'queenie', 'scnk', 'freekromer','badtime','tobydog','spamtong'}; local loops = {false,false,false,false, false, false}
local adsChecks = {}
local adsTimer = 1.8

function onCreate()
	precacheImage('popups')
end
function onCreatePost()
	setProperty('iconP2.y',getProperty('iconP2.y') -20)
end
function onSongStart()
adsPop()
end

function adsPop()
	if downscroll then
		bruh1 = 50
		bruh2 = 400
	else
		bruh1 = 400
		bruh2 = 50
	end
	makeAnimatedLuaSprite('ads'..adsCount, 'popups', getRandomInt(200, 800), getRandomInt(bruh2, bruh1))
	for i = 1,6 do addAnimationByPrefix('ads'..adsCount, anims[i], anims[i], 20, loops[i]) end
	setObjectCamera('ads'..adsCount, 'other');
	scaleObject('ads'..adsCount,0.7,0.7)
	objectPlayAnimation('ads'..adsCount, anims[getRandomInt(1, 6)])
	addLuaSprite('ads'..adsCount, true)

	runTimer('adsgone'..adsCount, adsTimer)
	adsChecks[adsCount] = true

	adsCount = adsCount + 1
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag:startswith('adsgone') then removeLuaSprite('ads'..adsCount,true) adsCount = adsCount - 1 adsPop() end
end

function onEvent(n,v1,v2)
	if n == 'Play Animation' then
		if v1 == 'laugh' then
			adsTimer = 0.5
		end
	end
end

function string:startswith(start)
    return self:sub(1, #start) == start
end

function string:endswith(ending)
    return ending == "" or self:sub(-#ending) == ending
end

function butch(str)
	local result = {}; local num = 1
	local ret = ''

	for i in string.gmatch(str, "%S+") do
	   table.insert(result, num, i)
	   num = num + 1
	end

	ret = result[1]..result[2]
	return ret
end