function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end


function onCreatePost()
makeAnimatedLuaSprite('HBA', 'healthBarAnim', 0, 0)
addAnimationByPrefix('HBA', 'moven', 'healthmove', 24, true)
setObjectCamera('HBA', 'hud')
addLuaSprite('HBA', false)

makeAnimatedLuaSprite('TBA', 'healthBarAnim', 0, 0)
addAnimationByPrefix('TBA', 'moven', 'healthmove', 24, true)
setProperty('TBA.scale.x', 0.99)
setObjectCamera('TBA', 'hud')
addLuaSprite('TBA', false)


setObjectOrder('healthBarBG', 1)
setObjectOrder('healthBar', 2)
setObjectOrder('HBA', 3)
setObjectOrder('iconP1', 4)
setObjectOrder('iconP2', 5)

setObjectOrder('timeBarBG', 6)
setObjectOrder('timeBar', 7)
setObjectOrder('TBA', 8)
setObjectOrder('timeTxt', 9)

setProperty('timeBarBG.scale.x', 1.493)
setProperty('timeBar.scale.x', 1.493)



end



function onUpdate(elapsed)

setProperty('HBA.x', getProperty('healthBarBG.x'))
setProperty('HBA.y', getProperty('healthBarBG.y'))
setProperty('HBA.alpha', getProperty('healthBarBG.alpha'))
setProperty('HBA.visible', getProperty('healthBarBG.visible'))
setProperty('HBA.angle', getProperty('healthBarBG.angle'))

setProperty('HBA.offset.x', getProperty('healthBarBG.offset.x'))
setProperty('HBA.offset.y', getProperty('healthBarBG.offset.y'))


setTimeBarColors(rgbToHex(getProperty('boyfriend.healthColorArray')), rgbToHex(getProperty('dad.healthColorArray')))
setProperty('TBA.x', getProperty('timeBarBG.x') - 101)
setProperty('TBA.y', getProperty('timeBarBG.y'))
setProperty('TBA.alpha', getProperty('timeBarBG.alpha'))
setProperty('TBA.visible', getProperty('timeBarBG.visible'))
setProperty('TBA.angle', getProperty('timeBarBG.angle'))

setProperty('TBA.offset.x', getProperty('timeBarBG.offset.x'))
setProperty('TBA.offset.y', getProperty('timeBarBG.offset.y'))
end