function onCreate()
makeAnimatedLuaSprite('effcteye', 'idk', -20,0)
addAnimationByPrefix('effcteye', 'idle', 'idle', 13, true)
setProperty('effcteye.alpha', 0)
scaleObject('effcteye', 2.6,2.6)
setObjectCamera('effcteye', 'Other')



makeLuaSprite('credit', 'cred2', 0,0)
setObjectCamera('credit', 'other')
scaleObject('credit', 0.67, 0.67)
setProperty('credit.alpha', 0)
addLuaSprite('credit', false)



makeLuaSprite('credit2', 'cred', 0,720)
setObjectCamera('credit2', 'other')
scaleObject('credit2', 0.67, 0.67)
setProperty('credit2.alpha', 0)
addLuaSprite('credit2', false)




addLuaSprite('effcteye', false)

initLuaShader("CameraGlitch")
setSpriteShader("effcteye", "CameraGlitch")

setProperty('effcteye.useFramePixels', true)
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)


makeAnimatedLuaSprite('cooldad', 'characters/F1NN', -300, 0)

setProperty('cooldad.alpha', 0)
setProperty('cooldad.scale.x', getProperty('dad.scale.x'))
setProperty('cooldad.scale.y', getProperty('dad.scale.y'))
setObjectCamera('cooldad', 'other')
addLuaSprite('cooldad', true)


makeAnimatedLuaSprite('coolbf', getProperty('boyfriend.imageFile'), 1000,400)

setObjectCamera('coolbf', 'other')


setProperty('coolbf.alpha', 0)

setProperty('coolbf.scale.x', getProperty('boyfriend.scale.x'))
setProperty('coolbf.scale.y', getProperty('boyfriend.scale.y'))
addLuaSprite('coolbf', true)

end

bet = 0
Followcam = false
function onUpdate()
if getProperty('cooldad.alpha') > 0  and luaSpriteExists('cooldad') then
setProperty('cooldad.offset.x', getProperty('dad.offset.x'))
setProperty('cooldad.offset.y', getProperty('dad.offset.y'))
setProperty('cooldad.animation.frameName', getProperty('dad.animation.frameName'))
end
if getProperty('coolbf.alpha') > 0  and luaSpriteExists('coolbf') then
setProperty('coolbf.offset.x', getProperty('boyfriend.offset.x'))
setProperty('coolbf.offset.y', getProperty('boyfriend.offset.y'))

setProperty('coolbf.animation.frameName', getProperty('boyfriend.animation.frameName'))
end

if Followcam == 'bmo' then
setProperty('camFollow.x', 1250)
setProperty('camFollow.y', 100)

elseif Followcam == 'both' then
setProperty('camFollow.x', 1050)
setProperty('camFollow.y', 100)

end


if getProperty('effcteye.alpha') > 0  and luaSpriteExists('effcteye') then
setShaderFloat("effcteye", "iTime", os.clock())
end
end

function onSongStart()
doTweenAlpha('nbe7w', 'effcteye', 1, 1, 'linear')
end

function onStepHit()
if curStep == 80 then
doTweenAlpha('nbe7w', 'effcteye', 0, 15, 'linear')
doTweenAlpha('nbe7wt', 'camGame', 1, 5, 'linear')
setProperty('dad.color', getColorFromHex('000000'))
setProperty('bg.color', getColorFromHex('424242'))
setProperty('gf.color', getColorFromHex('000000'))


elseif curStep == 129 then
setProperty('dad.color', getColorFromHex('ffffff'))
setProperty('gf.color', getColorFromHex('ffffff'))
setProperty('bg.color', getColorFromHex('ffffff'))
setProperty('camHUD.alpha', 1)
doTweenAlpha('nbe7wt', 'camGame', 1, 0.01, 'linear')
doTweenAlpha('nbe7w', 'effcteye', 0, 0.01, 'linear')

elseif curStep == 256 or curStep == 833 or curStep == 873 or curStep == 960 or curStep == 1408 or curStep == 1600 or curStep == 1664 then
Followcam = 'both'

elseif curStep == 625 then
Followcam = 'bmo'
elseif curStep == 378 or curStep == 639 or curStep == 849 or curStep == 897 or curStep == 976 or curStep == 1632 then
Followcam = 'nil'

elseif curStep == 1410 then
setProperty('healthBar.visible', false)
setProperty('healthBarBG.visible', false)
setProperty('iconP2.visible', false)
setProperty('iconP1.visible', false)
setProperty('timeBar.visible', false)
setProperty('timeBarBG.visible', false)
setProperty('timeTxt.visible', false)
setProperty('scoreTxt.visible', false)


elseif curStep == 1472 then
doTweenAlpha('oah2bf', 'cooldad', 0.5,1,'expoOut')
doTweenAlpha('oah2b', 'coolbf', 0.5,1,'expoOut')
setProperty('camGame.alpha', 0)
doTweenZoom('uy2r', 'camOther', 0.6, 0.1, 'linear')
setProperty('camOther.zoom', 0.6)
doTweenX('oadh2', 'coolbf', 100,1,'expoOut')
doTweenX('oah29b', 'cooldad', 600,1,'expoOut')
runTimer('hh', 0.55)
elseif curStep == 1528 then

setProperty('camOther.alpha', 0)
setProperty('camHUD.alpha', 0)
removeLuaSprite('cooldad', true)
removeLuaSprite('coolbf', true)
elseif curStep == 1531 then
setProperty('healthBar.visible', true)
setProperty('healthBarBG.visible', true)
setProperty('iconP2.visible', true)
setProperty('iconP1.visible', true)
setProperty('timeBar.visible', true)
setProperty('timeBarBG.visible', true)
setProperty('timeTxt.visible', true)
setProperty('scoreTxt.visible', true)

elseif curStep == 1536 then
setProperty('camOther.alpha', 1)
setProperty('camHUD.alpha', 1)
setProperty('camGame.alpha', 1)
doTweenZoom('uy2r', 'camOther', 1, 0.1, 'linear')
setProperty('camOther.zoom', 1)


elseif curStep == 1728 then
setProperty('effcteye.alpha', 0.7)
setProperty('credit.alpha', 1)
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
setProperty('credit2.alpha', 1)


elseif curStep == 1792 then
doTweenY('9wyv2', 'credit', -1000, 2, 'quadInOut')
doTweenY('9wyv222', 'credit2', 0, 1.7, 'quadInOut')
elseif curStep == 1856 then
doTweenY('9wyv222', 'credit2', -1000, 2, 'quadInOut')

end
end

function onBeatHit()
if curBeat %bet == 0 then
triggerEvent('flashzoom')
end
end

valy = 10
sped = 0.3
function onEvent(n,v1,v2)
	if n == 'flashzoom' then
doTweenAngle('d8', 'camHUD', 0, sped, 'bounceOut')
doTweenAngle('d88', 'camGame', 0, sped, 'bounceOut')
doTweenX('d888', 'camHUD', 0, sped, 'bounceOut')
doTweenX('d8888', 'camGame', 0,sped, 'bounceOut')

doTweenY('d88888', 'camHUD', 0, sped, 'bounceOut')
doTweenY('d888888', 'camGame', 0, sped, 'bounceOut')
triggerEvent('Add Camera Zoom', '0.2', '0.1')

setProperty('flash2.alpha',0.2)
doTweenAlpha('fl','flash2',0,0.5,'linear')

setProperty('camHUD.y', valy)
setProperty('camGame.y', valy)
if angl then
angl = false
setProperty('camHUD.angle', 5)
setProperty('camGame.angle', 5)


setProperty('camHUD.x', valy)
setProperty('camGame.x', valy)
else
angl = true
setProperty('camHUD.angle', -5)
setProperty('camGame.angle', -5)


setProperty('camHUD.x', -valy)
setProperty('camGame.x', -valy)
end

elseif n == 'bet' then
bet = v1

end
end

function onMoveCamera(focus)
if dadName == 'F1nn' then
if focus == 'dad' then
setProperty('cameraSpeed', 1000)
triggerEvent('glitchy', '1,1', '0.2')
runTimer('norspeed', 0.1)
	end
end
end

function onTimerCompleted(t)
if t == 'norspeed' then
setProperty('cameraSpeed', 1)
elseif t == 'hh' then
doTweenX('oadh2', 'coolbf', -300,9,'linear')
doTweenX('oah2b', 'cooldad', 1000,9,'linear')

end
end

