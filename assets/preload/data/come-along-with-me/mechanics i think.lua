--note glitch thing


colorH = {'80FF00'--[[green]]       ,                 'FF8000'--[[Orange]]                     , 'FF0600'--[[red]]                        , '007FFF'--[[blue]]                       , '9200FF'--[[purple]]                     , 'FD00FF'--[[pink]]                       , 'FFE600'--[[yellow]]                     , '00F3FF'--[[cyan]]                       , 'FF0061'--[[red?]]                       , '00FF5E'--[[green?]]}

function onCreate()
addLuaScript('data/come-along-with-me/CA')
addLuaScript('data/come-along-with-me/cooltrail')
addCharacterToList('F1nn')
addCharacterToList('Finn')
addCharacterToList('F1N4')
initLuaShader("INV")
setSpriteShader("dad", "INV")
setShaderInt("dad", "invert", 0)
end

allowed = true
function onUpdate()
colodo = math.random(1,#colorH)
if curStep == 1471 then
allowed = false
elseif curStep == 1536 then
allowed = true

end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)

if allowed then
if getProperty('dad.animation.curAnim.name') == 'singUP-alt' or getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' or getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' or getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt'then

doTweenColor('jojclr', 'bg', colorH[colodo], 0.01, 'linear')
doTweenColor('jojr2', 'gf', colorH[colodo], 0.01, 'linear')

setProperty('dad.useFramePixels', true)
setSpriteShader("dad", "INV")
setShaderInt("dad", "invert", 1)

doTweenAlpha('ji', 'camGame', 0, 0.01, 'linear')
doTweenAlpha('ji2', 'camHUD', 0, 0.01, 'linear')--using tween because this will make it 100% that it won't stop at Alph 0 for game or hud
triggerEvent('Add Camera Zoom', '0.05', '0.05')
triggerEvent('glitchy', '0.3,0.5,8', '0.1')
if getProperty('dad.useFramePixels') then
triggerEvent('cooltrail', '134', 'dad')
end
end
end
end

function onTweenCompleted(tag)
if tag == 'jojclr' then
doTweenColor('jojr', 'bg', 'FFFFFF', 0.3, 'linear')
doTweenColor('jojr2', 'gf', 'FFFFFF', 0.3, 'linear')
setSpriteShader("dad", "INV")
setShaderInt("dad", "invert", 0)

elseif tag == 'ji' then
setProperty('dad.useFramePixels', false)
triggerEvent('cooltrail', '134', 'dad')
doTweenAlpha('ji3', 'camGame', 1, 0.01, 'linear')
doTweenAlpha('ji4', 'camHUD', 1, 0.01, 'linear')
end
end