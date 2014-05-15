-- Kit v1.0 unstable dist. API
-- Copyright AxTo Inc. Released under the MIT License.

-- Made for ComputerCraft 1.6 and above.

-- How to include the API in your file (assuming that this file is called "kit"):
-- os.loadAPI("kit")
-- Now call a function from this file using:
-- kit.functionName()

-- Chceks if computer is an advanced computer (boolean response).
function isAdvanced()
    if term.isColor() == false then
        return false
    else
        return true
    end
end

-- Checks all sides for peripherals and wraps them (number of wrapped sides response).
function wrapSides()
    local peripherals = periheral.getNames()
    for i = 1, #peripherals do
        peripheral.getType(peripherals[i]) = peripheral.wrap(i)
    end
    return i
end

-- Checks if preipheral is present (boolean response).
-- Make sure that you don't provide an empty parameter.
-- Parameters:
--  peripheral: the wrapped peripheral to search for (required).
function isPresent(peripheral)
    if peripheral == nil then
        return false
    else
        return true
    end
end

-- Load a file or webpage (fetched data respponse).
-- Parameters:
--  path: the path to the file including the file name (required).
--  isurl: if path is an URL. Use 'true' if path is an URL (optional).
function load(path, isurl)
  if path == "" or path == nil then
      return false
  end
  if isurl == true then
    local file = http.get(path)
    local data = file.readAll()
    return data
  else
    if fs.exists(path) then
      local file = fs.open(path, "r")
      local data = file.readAll()
      file.close()
      return data
    else
      return false
    end
  end
end

-- Save data to file (boolean response).
-- Parameters:
--  data: the text/code you want to save (required).
--  path: the path to the file including the file name (required).
--  method: (required)
--    "w" to open it for writing and remove any existing data on file open.
--    "a" to open for writing but keep existing data and append any writes to the end of the file.
function save(data, path, method)
  if data == "" or data == nil or path == "" or path == nil or method == "" or method == nil then
      return false
  end
  if method == "w" or method == "a" then
    local file = fs.open(path, method)
    file.write(data)
    file.close()
    return true
  else
    return false
  end
end

-- Explode a string by seperator (table response).
-- Parameters:
--  seperator: explode at this character (required).
--  string: data to explode (required).
function explode(seperator, string)
    local table = {}
    if seperator == "" or seperator == nil or string == "" or string == nil then
        return false
    else
        for i in string.gmatch(string, seperator) do
            table.insert(table, i)
        end
        return table
    end
end
