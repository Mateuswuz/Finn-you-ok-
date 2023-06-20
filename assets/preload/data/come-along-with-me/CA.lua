function onCreatePost()
initLuaShader("glitchy")
initLuaShader("ChromaticAbberation")
initLuaShader("blur")

makeLuaSprite("temporaryShader1")
setSpriteShader("temporaryShader1", "glitchy")

makeLuaSprite("temporaryShader2")
setSpriteShader("temporaryShader2", "blur")

makeLuaSprite("Shader")
setSpriteShader("Shader", "ChromaticAbberation")


		runHaxeCode([[
trace(ShaderFilter);

game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader1").shader),new ShaderFilter(game.getLuaObject("temporaryShader2").shader)]);

game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader1").shader),new ShaderFilter(game.getLuaObject("temporaryShader2").shader),new ShaderFilter(game.getLuaObject("Shader").shader)]);

		]])
addHaxeLibrary("ShaderFilter1", "openfl.filters")

setShaderFloat("temporaryShader2", "cx", 0.5)
setShaderFloat("temporaryShader2", "cy", 0.5)
setShaderFloat("Shader", "amount", 0.2)

end

-----------------------------------------------
stop = true
AMT = 0
SPEED = 0
youcanshake = true
function onUpdatePost()
setShaderFloat("temporaryShader2", "blurWidth", blurval)
if not stop then
setShaderFloat("temporaryShader1", "iTime", os.clock())
setShaderFloat("temporaryShader1", "AMT", AMT)
setShaderFloat("temporaryShader1", "SPEED", SPEED)

end
end
M = 0.2
function onUpdate(elapsed)
blurval = math.lerp(blurval, 0, boundTo(elapsed * 7, 0, 500));

if curStep >= 1376 and curStep < 1400 then
M = M + 0.03
setShaderFloat("Shader", "amount", M)

elseif curStep == 1400 then
M = 0.2
setShaderFloat("Shader", "amount", 0.2)
end
end
-----------------------------------------------

-----------------------------------------------
function mysplit (inputstr, sep)--i didn't make this. -latter
if sep == nil then
sep = "%s";
end
local t = {};
for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
table.insert(t, str);
end
return t;
end
-----------------------------------------------

-----------------------------------------------
function onEvent(n,v1,v2)
local table = mysplit(v1,",");
local tabledos = mysplit(v2,",");
if n == 'Add Camera Zoom' then
blurval = v2
end

if n == 'glitchy' then
stop = false

AMT = table[1]
SPEED = table[2]
runTimer('nduw', tabledos[1])
end
end
-----------------------------------------------
function opponentNoteHit(id, direction, noteType, isSustainNote)
if getProperty('health') > 0.1 then
if dadName == 'F1N4' then
setProperty('health', getProperty('health')- 0.013);
if youcanshake then
Shake = getRandomInt(0,30)
ShakeAMT = getRandomFloat(0.0001,1)
ShakeSPEED = getRandomFloat(0.0001,1)
if Shake <= 3 then

triggerEvent('glitchy', ShakeAMT..','..ShakeSPEED, '0.03')
cameraShake('game', 0.02, 0.03);
cameraShake('hud', 0.02, 0.03);
end
end
elseif dadName == 'F1nn' then
setProperty('health', getProperty('health')- 0.007);
end
end
end
-----------------------------------------------
function onTimerCompleted(tag)
if tag == 'nduw' then
AMT = 0
SPEED = 0
setShaderFloat("temporaryShader1", "AMT", 0)
stop = true
end
end
-----------------------------------------------

-----------------------------------------------
function boundTo(value, min, max)
return math.max(min, math.min(max, value))
end
function math.lerp(from,to,i)
return from+(to-from)*i
end
-----------------------------------------------