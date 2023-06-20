
offsetX = 60--offset for the X
offsetY = 60--offset for the Y

--i stole this lol

CLO = false--original cam switch from false or true
CLX = nil--original cam but X
CLY = nil--original cam but Y

P = nil-- detect if it's player or opponent

CPX = nil--this is the cam movement it self supported by the offsetX
CPY = nil--this is the cam movement it self supported by the offsetY


function onMoveCamera(focus)

	CPX = getProperty('camFollow.x')
	CPY = getProperty('camFollow.y')

	if focus == 'boyfriend' then
		CLO = false
		P = 1

	elseif focus == 'dad' then
		CLO = false
		P = 2

	elseif focus == 'gf' then
		CLO = false

		if mustHitSection then--camera focus for gf, it depends if it's mustHitSection gf focus or other
			P = 1
		else
			P = 2
		end
	end
end

function onUpdateFixedPost()

--this is reset the offset without changing the actual tag it self
	if CLO == true then
		setProperty('camFollow.x', CLX)
		setProperty('camFollow.y', CLY)
	end
end


--bf and gf if camera focus on gf
function goodNoteHit(id, direction, noteType, isSustainNote)

	if P == 1 then

		CLO = true
	if direction == 0 then
		CLX = CPX - offsetX
		CLY = CPY
	elseif direction == 1 then
		CLX = CPX
		CLY = CPY + offsetY
	elseif direction == 2 then
		CLX = CPX
		CLY = CPY - offsetY
	elseif direction == 3 then
		CLX = CPX + offsetX
		CLY = CPY
	else
		CLX = CPX
		CLY = CPY
end
end
end


--dad and gf if camera focus on gf
function opponentNoteHit(id, direction, noteType, isSustainNote)

	if P == 2 then

		CLO = true
	if direction == 0 then
		CLX = CPX - offsetX
		CLY = CPY
	elseif direction == 1 then
		CLX = CPX
		CLY = CPY + offsetY
	elseif direction == 2 then
		CLX = CPX
		CLY = CPY - offsetY
	elseif direction == 3 then
		CLX = CPX + offsetX
		CLY = CPY
	else
		CLX = CPX
		CLY = CPY
end
end
end