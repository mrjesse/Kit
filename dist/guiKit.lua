-- GuiKit v1.0 unstable dist. API
-- Copyright AxTo Inc. Released under the MIT License.

-- Made for ComputerCraft 1.6.
-- Use this file in combination with the normal Kit!

-- How to include the API in your file (assuming that this file is called "guiKit"):
-- os.loadAPI("kit")
-- os.loadAPI("guiKit")
-- Now call a function from this file using:
-- guiKit.functionName()

-- Draw a rectangle (Boolean response).
-- Make sure to use number colors, and not named colors!
-- Parameters: 
--  startX: The starting X pos of the square (number) (required).
--  startY: The starting Y pos of the square (number) (required).
--  width:  The width of the square (number) (required).
--  height: The height of the square (number) (required).
--  color: The color of the square or nil if you want an outlined square (number or nil).
--  fillingColor: The color of the filling or nil if you just want a regular square (number or nil).
--  outlineColor: The color of the outline or nil if you want a regular square (number or nil).
function drawRectangle(startX,startY,width,hight,color,fillingColor,outlineColor)
  if startX == nil or startX == "" or startY == nil or startY == "" or width == nil or width == "" then
    error("Invalid arguments for drawRectangle()")
  end
  if color ~= nil then
    local window = window.create(term.current(), startX, startY, width ,hight , true)
    window.setBackgroundColor(color)
    window.clear()
  else
    if outlineColor ~= nil then
      local windowOutline = window.create(term.current(), startX, startY, width, hight, true)
      windowOutline.setBackgroundColor(outlineColor)
      windowOutline.clear()
      if fillingColor ~= nil then
        local windowFilling = window.create(term.current(), startX+1, startY+1, width-2 ,hight-2 , true)
        windowFilling.setBackgroundColor(fillingColor)
        windowFilling.clear()
      end
    end
  end
  term.setCursorPos(startX,startY)
end

-- Draw Button And Make It Functioning (Boolean response).
-- Parameters:
--  startX: Where you want to start your button on the x axis (number) (required).
--  startY: Where you want to start your button on the y axis (number) (required).
--  width: How wide you want your button to be (number) (required).
--  height: How high you want your button to be (number) (required).
--  backgroundColor: What color you want your button to be (number) (required).
--  textColor: What color you want your text to be (number) (required).
--  flickerOnClick: If the button will turn yellow and back to the backgroundColor (true or false) (required).
--  textX: Where you want your text to start on the x axis (number) (required).
--  textY: Where you want your text to start on the y axis (number) (required).
--  text: The text that will be displayed (string) (required).
--  waitForClick: If you want to wait for the user to click on your button (true or false) (required).
function button(startX,startY,width,height,backgroundColor,textColor,flickerOnClick,textX,textY,text,waitForClick)
  if startX == nil or startX == "" or startY == nil or startY == "" or width == nil or width == "" or height == nil or height == "" or backgroundColor == nil or backgroundColor == "" or textColor == nil or textColor == "" or flickerOnClick == nil or flickerOnClick == "" or textX == nil or textX == "" or textY == nil or textY == "" or text == nil or text == "" or waitForClick == nil or waitForClick == "" then
    error("Invalid arguments for button()")
  end
  drawRectangle(startX,startY,width,height,backgroundColor,nil,nil)
  term.setCursorPos(textX,textY)
  trm.setBackgroundColor(backgroundColor)
  term.setTextColor(textColor)
  print(text)
  if waitForClick == true then
    local event,mouse,clickX,clickY= os.pullEvent("mouse_click")
    if clickX > startX - 1 and clickY > startY -1 and clickX < width+1 and clickY < height + 1 then
      if flickerOnClick == true then
        sleep(0.2)
        drawRectangle(startX,startY,width,height,16,nil,nil)
        term.setCursorPos(textX,textY)
        term.setBackgroundColor(16)
        term.setTextColor(textColor)
        print(text)
        sleep(0.2)
        return true
      else
        return false
      end
    end
  end
end
