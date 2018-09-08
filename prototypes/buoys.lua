local floating_pole=table.deepcopy(data.raw["electric-pole"]["big-electric-pole"])
floating_pole.name = "floating-electric-pole"
floating_pole.collision_mask = {'ground-tile', 'object-layer'}
floating_pole.collision_box = {{-1.2, -1.2}, {1.2, 1.2}}
floating_pole.selection_box = {{-1.3, -1.3}, {1.3, 1.3}}
floating_pole.maximum_wire_distance = 45
floating_pole.supply_area_distance = 0
floating_pole.pictures =
    {
      filename =  "__cargo-ships__/graphics/entity/floating_electric_pole/floating-electric-pole.png",
      priority = "high",
      width = 168,
      height = 165,
      direction_count = 4,
      shift = {1.6, -1.1}
    }

local buoy=table.deepcopy(data.raw["rail-signal"]["rail-signal"])
buoy.name = "buoy"
buoy.collision_mask = {'ground-tile', 'object-layer'}
buoy.selection_box =  {{-1.6, -0.8}, {0.01, 0.8}}
buoy.fast_replaceable_group = "buoy"
buoy.minable = {mining_time = 0.5, result = "buoy"}
buoy.animation =
{
  filename = "__cargo-ships__/graphics/entity/buoy/buoys.png",
  priority = "high",
  width = 144,
  height = 144,
  frame_count = 3,
  direction_count = 8,
  scale = 0.8
}
buoy.rail_piece = nil


local chain_buoy=table.deepcopy(data.raw["rail-chain-signal"]["rail-chain-signal"])
chain_buoy.name = "chain_buoy"
chain_buoy.collision_mask = {'ground-tile', 'object-layer'}
chain_buoy.selection_box =  {{-1.6, -0.8}, {0.01, 0.8}}
chain_buoy.fast_replaceable_group = "buoy"
chain_buoy.minable = {mining_time = 0.5, result = "chain_buoy"}
chain_buoy.animation =
{
  filename = "__cargo-ships__/graphics/entity/chain_buoy/chain_buoys.png",
  priority = "high",
  width = 256,
  height = 256,
  frame_count = 5,
  direction_count = 8,
  scale = 0.8,
  shift = {0.5,0.3}

}
chain_buoy.rail_piece = nil





local port=table.deepcopy(data.raw["train-stop"]["train-stop"])
port.name = "port"
port.icon = "__cargo-ships__/graphics/blank.png"
port.minable = {mining_time = 1, result = "port"}
port.rail_overlay_animations = nil
port.collision_mask = {"object-layer"}
port.collision_box =  {{-0.01, -0.9}, {1.9, 0.9}}
port.selection_box =  {{-0.01, -0.9}, {1.9, 0.9}}
port.animations = make_4way_animation_from_spritesheet({ layers =
  {
    {
      filename = "__cargo-ships__/graphics/entity/port/uniport.png",
      line_length = 4,
      width = 140,
      height = 291,
      direction_count = 4,
      shift = util.by_pixel(-0.5, -26.75),
      scale = 0.8
    }
  }
})
port.top_animations = nil
port.light1 =
{
  light = {intensity = 0.5, size = 5, color = {r = 1.0, g = 1.0, b = 1.0}},
  picture =
  {
    north =
    {
      filename = "__cargo-ships__/graphics/entity/port/port-light-1.png",
      width =14,
      height = 7,
      scale = 0.7,
      shift = util.by_pixel(36.5, -67.5),
    },
    west =
    {
      filename = "__cargo-ships__/graphics/entity/port/port-light-1.png",
      width =14,
      height = 7,
      scale = 0.7,
      shift = util.by_pixel(-2, -104.3),
    },
    south =
    {
      filename = "__cargo-ships__/graphics/entity/port/port-light-1.png",
      width =14,
      height = 7,
      scale = 0.7,
      shift = util.by_pixel(-39.5, -66),
    },
    east =
    {
      filename = "__cargo-ships__/graphics/entity/port/port-light-1.png",
      width =14,
      height = 7,
      scale = 0.7,
      shift = util.by_pixel(-2.7, -26.5),
    },
  },
  red_picture =
   {
    north =
    {
      filename = "__cargo-ships__/graphics/entity/port/port-red-light-1.png",
      width = 17,
      height = 10,
      frame_count = 1,
      shift = util.by_pixel(36.5, -67.5),
    },
    west =
    {
      filename = "__cargo-ships__/graphics/entity/port/port-red-light-1.png",
      width = 17,
      height = 10,
      frame_count = 1,
      shift = util.by_pixel(-2, -104.3),
    },
    south =
    {
      filename = "__cargo-ships__/graphics/entity/port/port-red-light-1.png",
      width = 17,
      height = 10,
      frame_count = 1,
      shift = util.by_pixel(-39.5, -66),
    },
    east =
    {
      filename = "__cargo-ships__/graphics/entity/port/port-red-light-1.png",
      width = 17,
      height = 10,
      frame_count = 1,
      shift = util.by_pixel(-2.7, -26.5),
    },
  }
}
port.light2 = nil
port.working_sound = nil


data:extend({buoy, chain_buoy, port, floating_pole})

