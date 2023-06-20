function onCreate()
	makeLuaSprite('bg', 'treehose', -1700, -1700);

	scaleObject('bg', 1.3, 1.3);
	addLuaSprite('bg', false);
makeAnimatedLuaSprite('hi', 'characters/axmc', -1610,-460)

addAnimationByPrefix('hi', 'idle', 'idle', 13, true)
objectPlayAnimation('hi', 'idle', true)
addAnimationByPrefix('hi', 'washere', 'sign', 24, true)

addLuaSprite('hi', false)

--close()
end


function onStepHit()
if curStep == 640 then
objectPlayAnimation('hi', 'washere', true)
end
end
