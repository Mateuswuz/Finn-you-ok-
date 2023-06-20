-- by latter

speed = 0.05--who fast do you want the effect to apply

timething = 0.5--timer for when the effect fully done

sizething = 0--how much do you want the effect to grow

above = false-- you can ether make it above the character or behind the character(true for above)

colors = 'nor'--in what way you want the trail to change the color(rainbow, healthbar, with_notes_color,non or false)

blend = 'SUBTRACT'--do you want to enable blend mode? (ADD,SUBTRACT,MULTIPLY,DIFFERENCE,NORMAL)

transparency = 1--i think that's pretty obvious

movement = 'nor'--the way it moves(random, fly, with_notes)


colortimer = 0.000000001

easeY = 'backIn'--Y
easeX = 'linear'--X
easeSY = 'linear'--Scale Y
easeSX = 'linear'--Scale X
easeA = 'linear'--Alpha

distance = 2000

cooltrail = false

play_trail = true

char = 'bfdad'
function onEvent(n,v1,v2)
if n == 'cooltrail' then
if tonumber(v1) and play_trail then
cooltrail = true
play_trail = false
elseif tonumber(v1) and not play_trail then
cooltrail = false
play_trail = true
end

if v2 == 'bf' then
char = 'bf'
elseif v2 == 'dad' then
char = 'dad'
elseif v2 == 'bfdad' then
char = 'bfdad'
end
end
end



function onCreate()
runTimer('coale', speed, 0)

end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end

i = 1

colorHex = {'80FF00'--[[green]]       ,                 'FF8000'--[[Orange]]                     , 'FF0600'--[[red]]                        , '007FFF'--[[blue]]                       , '9200FF'--[[purple]]                     , 'FD00FF'--[[pink]]                       , 'FFE600'--[[yellow]]                     , '00F3FF'--[[cyan]]                       , 'FF0061'--[[red?]]                       , '00FF5E'--[[green?]]}
function onUpdateFixed()
colododo = math.random(1,#colorHex)
end

function onTimerCompleted(tag)
if tag == 'coale' then
if cooltrail then
i = i + 1
if i >= 200 then
i = 0
end


tagn = ('jojo_reference'..i)
tagn2 = ('jojo_reference2'..i)
if char == 'dad' or char == 'bfdad' then
makeAnimatedLuaSprite(tagn, getProperty('dad.imageFile'), getProperty('dad.x'), getProperty('dad.y'))
doTweenAlpha('jojAOpp'..tagn, tagn, 0, timething, easeA)

doTweenX(tagn..'jojXOpp', tagn..'.scale', getProperty('dad.scale.x') + sizething, timething, easeSX)

doTweenY(tagn..'jojYOpp', tagn..'.scale', getProperty('dad.scale.y') + sizething, timething, easeSY)

updateHitbox(tagn)
setProperty(tagn..'.offset.x', getProperty('dad.offset.x'))
setProperty(tagn..'.offset.y', getProperty('dad.offset.y'))
setProperty(tagn..'.animation.frameName', getProperty('dad.animation.frameName'))
setProperty(tagn..'.flipX', getProperty('dad.flipX'))
setProperty(tagn..'.scale.x', getProperty('dad.scale.x'))
setProperty(tagn..'.scale.y', getProperty('dad.scale.y'))

setProperty(tagn..'.alpha', transparency)
setBlendMode(tagn, blend)
end


if char == 'bf' or char == 'bfdad' then
makeAnimatedLuaSprite(tagn2, getProperty('boyfriend.imageFile'), getProperty('boyfriend.x'), getProperty('boyfriend.y'))
doTweenAlpha('jojAbf'..tagn2, tagn2, 0, timething, easeA)

doTweenX(tagn2..'jojXbf', tagn2..'.scale', getProperty('boyfriend.scale.x') + sizething, timething, easeSX)

doTweenY(tagn2..'jojYbf', tagn2..'.scale', getProperty('boyfriend.scale.y') + sizething, timething, easeSY)

updateHitbox(tagn2)
setProperty(tagn2..'.offset.x', getProperty('boyfriend.offset.x'))
setProperty(tagn2..'.offset.y', getProperty('boyfriend.offset.y'))
setProperty(tagn2..'.animation.frameName', getProperty('boyfriend.animation.frameName'))
setProperty(tagn2..'.flipX', getProperty('boyfriend.flipX'))
setProperty(tagn2..'.scale.x', getProperty('boyfriend.scale.x'))
setProperty(tagn2..'.scale.y', getProperty('boyfriend.scale.y'))

setProperty(tagn2..'.alpha', transparency)
setBlendMode(tagn2, 'add')
end


if movement == 'with_notes' then

if getProperty('dad.animation.curAnim.name') == 'singUP' then
doTweenY(tagn..'jo', tagn..'.velocity', -distance,timething,easeY)

addLuaSprite(tagn, above)

elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' then
doTweenY(tagn..'jo', tagn..'.velocity', distance,timething,easeY)

addLuaSprite(tagn, above)

elseif getProperty('dad.animation.curAnim.name') == 'singLEFT' then
doTweenX(tagn..'jo', tagn..'.velocity', -distance,timething,easeX)

addLuaSprite(tagn, above)

elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
doTweenX(tagn..'jo', tagn..'.velocity', distance,timething,easeX)

addLuaSprite(tagn, above)

end



if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
doTweenY(tagn2..'jo2', tagn2..'.velocity', -distance,timething,easeY)

addLuaSprite(tagn2, above)
elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then

doTweenY(tagn2..'jo2', tagn2..'.velocity', distance,timething,easeY)

addLuaSprite(tagn2, above)
elseif getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then

doTweenX(tagn2..'jo2', tagn2..'.velocity', -distance,timething,easeX)

addLuaSprite(tagn2, above)
elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then

doTweenX(tagn2..'jo2', tagn2..'.velocity', distance,timething,easeX)

addLuaSprite(tagn2, above)
end



elseif movement == 'fly' then
doTweenY(tagn..'jo', tagn..'.velocity', -distance,timething,easeY)

doTweenY(tagn2..'jo2', tagn2..'.velocity', -distance,timething,easeY)

addLuaSprite(tagn, above)
addLuaSprite(tagn2, above)
elseif movement == 'random' then
doTweenY(tagn..'jo', tagn..'.velocity',  getRandomInt(-distance, distance),timething,easeY)
doTweenX(tagn..'jo2', tagn..'.velocity',  getRandomInt(-distance, distance),timething,easeX)

doTweenY(tagn2..'jo3', tagn2..'.velocity',  getRandomInt(-distance, distance),timething,easeY)
doTweenX(tagn2..'jo4', tagn2..'.velocity',  getRandomInt(-distance, distance),timething,easeX)


addLuaSprite(tagn, above)
addLuaSprite(tagn2, above)
else
addLuaSprite(tagn, above)
addLuaSprite(tagn2, above)
end



if colors == 'healthbar' then
setProperty(tagn..'.color', getColorFromHex(rgbToHex(getProperty('dad.healthColorArray'))))

setProperty(tagn2..'.color', getColorFromHex(rgbToHex(getProperty('boyfriend.healthColorArray'))))

elseif colors == 'with_notes_color' then

if getProperty('dad.animation.curAnim.name') == 'singUP' then
doTweenColor(tagn..'jojcolor', tagn, '1DE957', colortimer, 'linear')
elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' then
doTweenColor(tagn..'jojcolor', tagn, '78CEF8', colortimer, 'linear')
elseif getProperty('dad.animation.curAnim.name') == 'singLEFT' then
doTweenColor(tagn..'jojcolor', tagn, 'C151FF', colortimer, 'linear')
elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
doTweenColor(tagn..'jojcolor', tagn, 'F84F4F', colortimer, 'linear')
end



if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
doTweenColor(tagn2..'jojcolor2', tagn2, '1DE957', colortimer, 'linear')
elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
doTweenColor(tagn2..'jojcolor2', tagn2, '78CEF8', colortimer, 'linear')
elseif getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
doTweenColor(tagn2..'jojcolor2', tagn2, 'C151FF', colortimer, 'linear')
elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
doTweenColor(tagn2..'jojcolor2', tagn2, 'F84F4F', colortimer, 'linear')
end



elseif colors == 'rainbow' then
doTweenColor(tagn..'jojcolor', tagn, colorHex[colododo], colortimer, 'linear')
doTweenColor(tagn2..'jojcolor2', tagn2, colorHex[colododo], colortimer, 'linear')
end
end
end
end

function onTweenCompleted(tag)
for i = 1,100 do
tagn = ('jojo_reference'..i)
tagn2 = ('jojo_reference2'..i)
if tag == 'jojAOpp'..tagn then
removeLuaSprite(tagn, false)
elseif tag == 'jojAbf'..tagn2 then
removeLuaSprite(tagn2, false)

end
end
end