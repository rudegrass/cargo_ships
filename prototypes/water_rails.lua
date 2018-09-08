
railpictures = function()
  return railpicturesinternal({{"metals", "metals", mipmap = true},
                               {"backplates", "backplates", mipmap = true},
                               {"ties", "ties"},
                               {"stone_path", "stone-path"}})
end    

railpicturesinternal = function(elems)
  local keys = {{"straight_rail", "horizontal", 64, 64, 0, 0},
                {"straight_rail", "vertical", 64, 64, 0, 0},
                {"straight_rail", "diagonal-left-top", 64, 64, 0, 0},
                {"straight_rail", "diagonal-right-top", 64, 64, 0, 0},
                {"straight_rail", "diagonal-right-bottom", 64, 64, 0, 0},
                {"straight_rail", "diagonal-left-bottom", 64, 64, 0, 0},
                {"curved_rail", "vertical-left-top", 128, 256, 0, 0},
                {"curved_rail", "vertical-right-top", 128, 256, 0, 0},
                {"curved_rail", "vertical-right-bottom", 128, 256, 0, 0},
                {"curved_rail", "vertical-left-bottom", 128, 256, 0, 0},
                {"curved_rail" ,"horizontal-left-top", 256, 128, 0, 0},
                {"curved_rail" ,"horizontal-right-top", 256, 128, 0, 0},
                {"curved_rail" ,"horizontal-right-bottom", 256, 128, 0, 0},
                {"curved_rail" ,"horizontal-left-bottom", 256, 128, 0, 0}}
  local res = {}
  for _ , key in ipairs(keys) do
    part = {}
    dashkey = key[1]:gsub("_", "-")
    for _ , elem in ipairs(elems) do
      if(elem[1] == "metals") then
        part[elem[1]] = { sheet = {
    
            filename = string.format("__cargo-ships__/graphics/entity/%s/%s-%s-%s.png", dashkey, dashkey, key[2], elem[2]),
            priority = "extra-high", 
            flags = elem.mipmap and { "icon" },
            width = key[3],
            height = key[4],
            shift = {key[5], key[6]},
            variation_count = 1,
          }
        }
        else
          part[elem[1]] = { sheet = {
    
        filename = string.format("__cargo-ships__/graphics/blank.png", dashkey, dashkey, key[2], elem[2]),
        priority = "extra-high", 
          flags = elem.mipmap and { "icon" },
          width = 32,
          height = 32,
          shift = {0,0},
          variation_count = 1,
          }
        }
        end

    end
    dashkey2 = key[2]:gsub("-", "_")
    res[key[1] .. "_" .. dashkey2] = part
  end
  res["rail_endings"] = {
   sheets =
   {
     {
       filename = "__cargo-ships__/graphics/blank.png",
       priority = "high",
       width = 4,
       height = 4,
     },
     {
       filename = "__cargo-ships__/graphics/blank.png",
       priority = "high",
       flags = { "icon" },
       width = 4,
       height = 4,
     }
   }   

 }
  return res
end




data:extend({
  {
    type = "straight-rail",
    name = "straight-water-way",
    icon = "__cargo-ships__/graphics/blank.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    destructible=false,
    minable = {mining_time = 0.2, result = "water-way"},
    max_health = 100,
    corpse = nil,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
    collision_mask = {'ground-tile', 'object-layer'},
    rail_category = "regular",
    pictures = railpictures(),
  },
  {
    type = "curved-rail",
    name = "curved-water-way",
    icon = "__cargo-ships__/graphics/blank.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
    destructible=false,
    minable = {mining_time = 0.2, result = "water-way", count = 4},
    max_health = 200,
    corpse = nil,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.75, -0.55}, {0.75, 1.6}},
    secondary_collision_box = {{-0.65, -2.43}, {0.65, 2.43}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    collision_mask = {'ground-tile', 'object-layer'},
    rail_category = "regular",
    pictures = railpictures(),
    placeable_by = { item="water-way", count = 4}
  },
})
