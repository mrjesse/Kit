-- OpenKit v1.0 unstable dist. API
-- Copyright AxTo Inc. Released under the MIT License.

-- Made for ComputerCraft 1.6 and OpenPeripherials Addons.
-- Use this file in combination with the normal Kit!

-- How to include the API in your file (assuming that this file is called "openKit"):
-- os.loadAPI("kit")
-- os.loadAPI("openKit")
-- Now call a function from this file using:
-- openKit.functionName()

-- Gets current position of given player using OpenPeripherals (table response).
-- Parameters:
--  player: the username of the player you want it's current position from (required).
--  side: the side of your sensor (required).
function getPosition(player, side)
  if player == nil or player == "" or side == nil or side == "" then
    return false
  end
  p = peripheral.wrap(side)
  xyz = {}
  xyz[1] = p.getPlayerData(player).position.x
  xyz[2] = p.getPlayerData(player).position.y
  xyz[3] = p.getPlayerData(player).position.z
  return xyz
end
