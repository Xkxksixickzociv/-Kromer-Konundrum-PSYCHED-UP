
function onEvent(n,v1,v2)
    if n == 'Camera Follow Pos' then
        if v2 == '100' then
            setProperty('defaultCamZoom',0.4)
        end
        if v1 == '' then
            setProperty('defaultCamZoom',0.55)
        end
    end
end
