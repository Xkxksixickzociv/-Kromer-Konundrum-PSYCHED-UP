
local zoominbro = false
local zoomoutbro = false
local zoomstand = false
local campointx = 0
local campointy = 0
local bfturn = false
local camMovement = 20
local velocity = 1

function onMoveCamera(focus)
  if focus == 'boyfriend' then
  campointx = getProperty('camFollow.x')
  campointy = getProperty('camFollow.y')
  bfturn = true
  setProperty('cameraSpeed', 1.3)
  elseif focus == 'dad' then
  campointx = getProperty('camFollow.x')
  campointy = getProperty('camFollow.y')
  bfturn = false
  setProperty('cameraSpeed', 1.3)
 end
end
function onCreate()
        makeLuaText('newScoreAcc','hey vsauce here',1000, 140, 0);
				setTextSize('newScoreAcc',16);
				addLuaText('newScoreAcc');
				setTextBorder("newScoreAcc", 1, '000001')
        if not downscroll then
					makeLuaText('sogn', '', 0, 4, 695);
					makeLuaText('daVer', 'Psych Engine v'..version,0, 1070, 695);
				  elseif  downscroll then
					makeLuaText('sogn', '', 0, 4, 5);
					makeLuaText('daVer', 'Psych Engine v'..version,0, 1070, 5);
				end
					setTextAlignment('sogn', 'left');
					setTextAlignment('daVer', 'right');
					setTextBorder("sogn", 1, '000001')
					setTextBorder("daVer", 1, '000001')
					setTextSize('sogn',17)
					addLuaText('sogn');
					setTextSize('daVer',17)
					addLuaText('daVer');
        if songName == 'Devilsknife' then
					setTextString('sogn', 'Devilsknife - CHAOS');
          setProperty('cameraSpeed', 2.1)
				end
      if songName == 'Bigshot' then
        setTextString('sogn','Bigshot - HARD');
        setProperty('cameraSpeed', 1.8)
      end
      if songName == '[NEO]' then
        setTextString('sogn','[NEO] - HARD');
        setProperty('cameraSpeed', 1.9)
      end
end
function onCreatePost()
  setProperty('timeBarBG.visible',false)
  setProperty('timeBar.visible',false)
  setProperty('timeTxt.visible',false)
  setProperty('scoreTxt.visible',false)
end
local theduckingRating = "N/A"
function onUpdate()
  if ratingName == '?' then
    theduckingRating = "N/A"
  elseif ratingName == 'You Suck!' then
    theduckingRating ='Dude for real?'
  elseif ratingName == 'Shit' then
    theduckingRating ='CLEAR'
  elseif ratingName == 'Bad' then
    theduckingRating ='F'
  elseif ratingName == 'Bruh' then
    theduckingRating ='E'
  elseif ratingName == 'Meh' then
    theduckingRating ='D'
  elseif ratingName == 'Nice' then
    theduckingRating ='C'	
  elseif ratingName == 'Good' then
    theduckingRating ='B'
  elseif ratingName == 'Great' then
    theduckingRating ='A'
  elseif ratingName == 'Sick!' then
    theduckingRating ='S'
  elseif ratingName == 'Perfect!!' then
    theduckingRating ='S+'
  elseif botPlay == true then
    theduckingRating ='N/A'
  end
  setObjectOrder('newScoreAcc',getObjectOrder('scoreTxt'))
	setProperty('newScoreAcc.y',getProperty('scoreTxt.y'))
  setTextString('newScoreAcc','Score: '..score..' - Accuracy: '..round((getProperty('ratingPercent') * 100), 2) ..'%'..' [' .. ratingFC .. ']'..' - Kromer Breaks: '..misses..' - Rank: '..theduckingRating)
end
function onEvent(n,v1,v2)
    if n == 'camShit' then
        if v1 == 'zoomin' then
            zoominbro = true
            zoomoutbro = false
            zoomstand = false
        end
        if v1 == 'zoomout' then
            zoomoutbro = true
            zoominbro = false
            zoomstand = false
        end
        if v1 == 'stand' then
            zoomstand = true
            zoomoutbro = false
            zoominbro = false
        end
    end
end
  
function onBeatHit()
  setProperty('iconP1.scale.x',1)
  setProperty('iconP2.scale.y',1)
  setProperty('iconP2.scale.x',1)
  setProperty('iconP1.scale.y',1)
  if zoominbro == true then
    setProperty('camHUD.zoom',0.95)
    doTweenZoom('broe','camHUD',1,0.3,'quadOut')
  elseif zoomoutbro == true then
    setProperty('camHUD.zoom',1.05)
    doTweenZoom('broe','camHUD',1,0.3,'quadOut')
  elseif zoomstand == true then
    setProperty('camHUD.zoom',1)
end
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
  n = math.pow(10, n or 0)
  x = x * n
  if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
  return x / n
end
function goodNoteHit(id, direction, noteType, isSustainNote)
  if bfturn then
    if direction == 0 then
      setProperty('camFollow.x', campointx - camMovement)
    elseif direction == 1 then
      setProperty('camFollow.y', campointy + camMovement)
    elseif direction == 2 then
      setProperty('camFollow.y', campointy - camMovement)
    elseif direction == 3 then
      setProperty('camFollow.x', campointx + camMovement)
    end
    setProperty('cameraSpeed', velocity)
  elseif not bfturn then
    if direction == 0 then
      setProperty('camFollow.x', campointx - camMovement)
    elseif direction == 1 then
      setProperty('camFollow.y', campointy + camMovement)
    elseif direction == 2 then
      setProperty('camFollow.y', campointy - camMovement)
    elseif direction == 3 then
      setProperty('camFollow.x', campointx + camMovement)
    end
  end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
if not bfturn then
  if direction == 0 then
    setProperty('camFollow.x', campointx - camMovement)
  elseif direction == 1 then
    setProperty('camFollow.y', campointy + camMovement)
  elseif direction == 2 then
    setProperty('camFollow.y', campointy - camMovement)
  elseif direction == 3 then
    setProperty('camFollow.x', campointx + camMovement)
  end
  setProperty('cameraSpeed', velocity)
elseif bfturn then
  if direction == 0 then
    setProperty('camFollow.x', campointx - camMovement)
  elseif direction == 1 then
    setProperty('camFollow.y', campointy + camMovement)
  elseif direction == 2 then
    setProperty('camFollow.y', campointy - camMovement)
  elseif direction == 3 then
    setProperty('camFollow.x', campointx + camMovement)
  end
end
end