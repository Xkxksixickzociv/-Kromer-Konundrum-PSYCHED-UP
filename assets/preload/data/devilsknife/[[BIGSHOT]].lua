-- Script made by Catbrother Everything with help by NardBruh. Credit is not needed but would be nice! :)
function onCreate()
	
	makeAnimatedLuaSprite('spamtonemote','characters/neofly',-1500,-1000);
	setProperty('spamtonemote.alpha',0)
	addAnimationByPrefix('spamtonemote', 'foryou', 'foryou', 22, false);
	makeAnimatedLuaSprite('spamton', 'characters/neospam', -1200, -1200); -- Change to characters idle in XML
	addAnimationByPrefix('spamton', 'idle', 'idle', 14, true); -- Change to characters idle in XML
    addAnimationByPrefix('spamton', 'singleft', 'left', 15, false); -- Change to characters leftnote in XML
    addAnimationByPrefix('spamton', 'singdown', 'down', 15, false); -- Change to characters downnote in XML
    addAnimationByPrefix('spamton', 'singup', 'up', 15, false); -- Change to characters upnote in XML
    addAnimationByPrefix('spamton', 'singright', 'right', 15, false); -- Change to characters rightnote in XML
	objectPlayAnimation('spamton', 'idle'); 
	setProperty('spamton.alpha',0)
	addLuaSprite('spamtonemote',false);
	addLuaSprite('spamton', false); -- false = add behind characters, true = add over characters
end
function onCreatePost()
	setProperty('iconP2.y',getProperty('iconP2.y')-10)
end
idleling = false

function onUpdate()
	if curStep == 1395 then
		if downscroll then
		for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'direction',90)
		end
	end
		setProperty('spamtonemote.alpha',1)
		objectPlayAnimation('spamtonemote','foryou');
	end
	if curStep == 1407 then
		setProperty('spamton.alpha',1)
		setProperty('spamtonemote.alpha',0)
		end
	if curStep == 1274 then
		for i = 0,3 do
		noteTweenAlpha('begone'..i,i,0,0.8,'quadOut')
		end
	end
end
function onTimerCompleted(t)
	if t == 'theidle' then
		objectPlayAnimation('spamton', 'idle');
		idleling = true
	end
end
