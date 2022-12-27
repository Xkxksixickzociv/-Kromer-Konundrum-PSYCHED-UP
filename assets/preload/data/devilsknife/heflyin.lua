

function onUpdate(elapsed)	
if not mustHitSection and getProperty('isCameraOnForcedPos') == false then
    cameraSetTarget("dad")
end
songPos = getSongPosition()

local currentBeat = (songPos/2500)*(curBpm/60)

doTweenY('opponentmove', 'dad', -250*math.sin((currentBeat+12*12)*math.pi), 2)

end
