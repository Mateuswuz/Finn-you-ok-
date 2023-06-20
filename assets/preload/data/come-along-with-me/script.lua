
function goodNoteHit(id, direction, noteType, isSustainNote)

if noteType == 'Alt Animation' or altAnim then
triggerEvent('cooltrail', '134', 'bf')
runTimer('getback', 0.01)
end

if direction == 0 then
triggerEvent('Play Animation', 'singLEFT', 'boyfriend')
elseif direction == 1 then
triggerEvent('Play Animation', 'singDOWN', 'boyfriend')
elseif direction == 2 then
triggerEvent('Play Animation', 'singUP', 'boyfriend')
elseif direction == 3 then
triggerEvent('Play Animation', 'singRIGHT', 'boyfriend')

end
end


function onTimerCompleted(tag)
if tag == 'getback' then
triggerEvent('cooltrail', '134', 'bf')

end
end

function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'); --put in mods/music/

end

function onGameOver()
cameraShake('camGame', 0.3,8)

end
