function onUpdate(elapsed)

	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.F1') then
	health = getProperty('health')
	setProperty('health', health+ 0.5);

	end
end