--[[
	CREDITS:
		- ShadowMario: made a multi-character script (from which I took animation offset)
		- Superpowers04: Helped with optimizing some code
		- MorenoTheCappuccinoChugger: Helped with note syncing (previous version on my youtube channel was off-sync)
		- BombasticTom (that's me!): Did most of the code.
--]]

animationsList = {}

local defaultstrumy
local noteoffset

local player3 = 'spamton' -- Change this to your LUA character
local isStrummin = false

function makeAnimationList()
	animationsList[0] = 'keyArrow' -- idle
	animationsList[1] = 'keyConfirm' -- key confirmed
	animationsList[2] = 'keyPressed' -- key miss
end

offsets = {};

function makeOffsets(object)
	offsets[0] = {x=36, y=36}
	offsets[1] = {x=61, y=59}
	offsets[2] = {x=34, y=34}
end

function onCreatePost()
	defaultstrumy = -200
	noteoffset = 820

	if not downscroll then
		defaultstrumy = -200
		noteoffset = -200
	end

	directions = {'left', 'down', 'up', 'right'}
	makeAnimationList()
	makeOffsets()

	for i=1, #directions do
		makeAnimatedLuaSprite('strumAlt'..directions[i], 'NOTE_assets', getPropertyFromGroup('opponentStrums', i-1, 'x') - 350, defaultstrumy)
		if not downscroll then
			setProperty('strumAlt'..directions[i]..'.y', defaultstrumy+100)
		end		

		addAnimationByPrefix('strumAlt'..directions[i], 'keyConfirm', directions[i]..' confirm', 24, false)
		addAnimationByPrefix('strumAlt'..directions[i], 'keyPressed', directions[i]..' press', 24, false)
		addAnimationByPrefix('strumAlt'..directions[i], 'keyArrow', 'arrow'..directions[i]:upper(), 24, false)

		setObjectCamera('strumAlt'..directions[i], 'camGame')
		scaleObject('strumAlt'..directions[i], 0.68, 0.68)
		
		setProperty('strumAlt'..directions[i]..'.alpha', 0)
		
		addLuaSprite('strumAlt'..directions[i])

		playAnimation('strumAlt'..directions[i], 0, true)
	end
end

function playAnimation(character, animId, forced) -- thank you shadowmario :evil:
	-- 0 = keyArrow
	-- 1 = keyConfirm
	-- 2 = keyPressed
	animName = animationsList[animId]

	objectPlayAnimation(character, animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
	
	setProperty(character..'.offset.x', offsets[animId].x);
	setProperty(character..'.offset.y', offsets[animId].y);
	
	if animId == 1 then
		runTimer('stopanim'..character, 0.1)
	end
end

function onTimerCompleted(tag)
	if(string.sub(tag,1,8) == "stopanim") then
        	playAnimation(string.sub(tag,9), 0, true)
    	end
end
function onUpdatePost()
	for i=0, getProperty('notes.length')-1 do
		if getPropertyFromGroup('notes', i, 'noteType') == 'plr3' then
			if not isStrummin then
				return
			end

			noteX = getPropertyFromGroup('notes', i, 'x');
			noteY = getPropertyFromGroup('notes', i, 'y');

			setPropertyFromGroup('notes', i, 'ignoreNote', true)	

			hitbox = 15;
			isSustainNote = getPropertyFromGroup('notes', i, 'isSustainNote');
			
			noteData = getPropertyFromGroup('notes', i, 'noteData');
			
			strumY = getProperty('strumAlt'..directions[noteData + 1]..'.y')	

			noteX = getProperty('strumAlt'..directions[noteData + 1]..'.x')
			if downscroll then
				noteY = (noteY - strumY - noteoffset - offsets[0].x)
			else
				noteY = (noteY + noteoffset + offsets[0].x)
			end

			if isSustainNote then
				noteX = noteX + 32;
				--noteY = noteY
			end
			
			setPropertyFromGroup('notes', i, 'x', noteX)
			setPropertyFromGroup('notes', i, 'y', noteY)
			--setPropertyFromGroup('notes', i, 'scale.x', 0.55)
			--setPropertyFromGroup('notes', i, 'scale.y', 0.55)
			direct = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
			if math.abs(noteY - strumY) <= hitbox then
				playAnimation('strumAlt'..directions[noteData+1], 1, false)
                triggerEvent('Play Animation', direct[noteData+1],'DAD')	
    			removeFromGroup('notes', i)
			end
			if downscroll then
				valAngle = -90
			else
				valAngle = 90
			end
		end
	end
end

function tobool(val)
	if val=='true' then
		return true
	else
		return false
	end
end

function onEvent(n, v1, v2)
	if n == '3rdstrum' then
		isStrummin = tobool(v1)
		if tobool(v1) then
			for strum=1, #directions do
				doTweenY('strumTweeningAlt'..strum, 'strumAlt'..directions[strum], defaultstrumy, 0.35 + 0.1*strum, 'quadInOut')
				doTweenAlpha('strumAlphaTweeningAlt'..strum, 'strumAlt'..directions[strum], 1, 0.35 + 0.05*strum, 'easeInOut')
			end
		else
			for strum=1, #directions do
				if downscroll then
					doTweenY('strumTweeningAlt'..strum, 'strumAlt'..directions[math.abs(strum-5)], defaultstrumy-100, 0.35 + 0.1*strum, 'quadInOut')
				else
					doTweenY('strumTweeningAlt'..strum, 'strumAlt'..directions[math.abs(strum-5)], defaultstrumy+100, 0.35 + 0.1*strum, 'quadInOut')
				end
				doTweenAlpha('strumAlphaTweeningAlt'..strum, 'strumAlt'..directions[math.abs(strum-5)], 0, 0.35 + 0.05*strum, 'easeInOut')
				
			end
		end
	end
end