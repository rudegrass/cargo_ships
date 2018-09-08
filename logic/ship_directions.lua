local offset = {}
offset[0] = {x = 0, y = 9.5}
offset[1] = {x = -7, y = 7}
offset[2] = {x = -9.5, y = 0}
offset[3] = {x = -7, y = -7}
offset[4] = {x = 0, y = -9.5}
offset[5] = {x = 7, y = -7}
offset[6] = {x = 9.5, y = 0}
offset[7] = {x = 7, y = 7}

function localize_engine(ent)
	local i = (math.floor((ent.orientation*8)+0.5))%8
	--game.players[1].print("NUMBER " .. i)

	local pos = {x = ent.position.x + offset[i].x, y = ent.position.y + offset[i].y}
	
	-- switch ne and sw (messed up factorio directions)
	if i == 1 then 
		i = 5
	elseif i == 5 then
		i = 1
	end
	return pos, i
end
