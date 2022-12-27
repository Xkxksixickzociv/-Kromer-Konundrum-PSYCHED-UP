--script by bbpanzu
local onBeat = false;
local dadsingL = 4
local bfsingL = 4
		realAnimdad = 'idle'
		realAnimbf = 'idle'
function getAnim(char,prop)
prop = prop or 'name'
	return getProperty(char .. '.animation.curAnim.' .. prop)

end


function onBeatHit()
	if onBeat then
		if getAnim("dad") == "idle"..getProperty('dad.idleSuffix') then
			if not songName == 'Devilsknife' then
			characterPlayAnim("dad","idle"..getProperty('dad.idleSuffix'),true)
		end
	end
		if getAnim("boyfriend") == "idle"..getProperty('boyfriend.idleSuffix') then
			characterPlayAnim("boyfriend","idle"..getProperty('boyfriend.idleSuffix'),true)
		end


	end

end
function onEvent(n,v1,v2)
	if n == "onBeat" then
		onBeat = v1 == "true"
	end
end