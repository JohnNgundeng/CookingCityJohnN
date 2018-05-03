-----------------------------------------------------------------------------------------
--
-- splash_screen.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the splash screen of the game. It displays the 
-- company logo that...
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )


-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- load physics
local physics = require("physics") 

-- start physics 
physics.start()
----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local logo
local bkgSound = audio.loadSound("Sounds/boom.mp3")
local splashSound
local GRAVITY = 39
local scrollSpeed = 20

------------------------------------------------------------------------------------
-- Functions 
------------------------------------------------------------------------------------

-- create the first banana 
local function Banana()

    -- creating the image 
    local banana = display.newImage("Images/Banana.png", 0, 0)

    -- set the x and the y pos 
    banana.x = 400
    banana.y = display.contentHeight*-3.3

    -- adding to physics 
    physics.addBody(banana) 

    -- makes the banana smaller 
    banana:scale(0.2,0.2)
end 

-- create the first banana 
local function Banana2()

    -- creating the image 
    local banana2 = display.newImage("Images/Banana.png", 0, 0)

    -- set the x and the y pos 
    banana2.x = 595
    banana2.y = display.contentHeight*-2.3

    -- adding to physics 
    physics.addBody(banana2) 

    -- makes the Banana smaller 
    banana2:scale(0.2,0.2)
end 

-- create the first cake 
local function Cake()
    
    -- creating the image 
    local cake = display.newImage("Images/Cake.png", 0, 0)

    -- set the x and the y pos 
    cake.x = display.contentWidth/2
    cake.y = display.contentHeight*-1.7

    -- adding to physics 
    physics.addBody(cake) 

    -- makes the cake smaller 
    cake:scale(0.5,0.5)
end 

-- create the second cake 
local function Cake2()

    -- creating the image 
    local cake2 = display.newImage("Images/Cake.png", 0, 0)

    -- set the x and the y pos 
    cake2.x = 368
    cake2.y = display.contentHeight*-2.7

    -- adding to physics 
    physics.addBody(cake2) 

    -- makes the cake smaller 
    cake2:scale(0.5,0.5)
end 

-- create the first fries
local function Fries()

    -- creating the image 
    local fries = display.newImage("Images/Fries.png", 0, 0)

    -- Setting the position of the fries
    fries.x = 200
    fries.y = display.contentHeight*-3.3

    -- adding to physics 
    physics.addBody(fries) 

    -- makes the fries smaller 
    fries:scale(0.5,0.5)
end  

    -- create the second Fries 
local function Fries2()

    -- creating the image 
    local fries2 = display.newImage("Images/Fries.png", 0, 0)

    -- set the x and the y pos 
    fries2.x = 695
    fries2.y = display.contentHeight*-2

    -- adding to physics 
    physics.addBody(fries2) 

    -- makes the fries smaller 
    fries2:scale(0.5,0.5)
end 

-- create the first pizza 
local function Pizza()

    -- creating the image 
    local pizza = display.newImage("Images/Pizza.png", 0, 0)

    -- set the x and the y pos 
    pizza.x = 725
    pizza.y = display.contentHeight*-2

    -- adding to physics 
    physics.addBody(pizza) 

    -- makes the first pizza smaller 
    pizza:scale(0.5,0.5)
end 

-- create the second pizza
local function Pizza2()

    -- creating the image 
    local pizza2 = display.newImage("Images/Pizza.png", 0, 0)

    -- set the x and the y pos 
    pizza2.x = 600
    pizza2.y = display.contentHeight*-2

    -- adding to physics 
    physics.addBody(pizza2) 

    -- makes the second pizza smaller 
    pizza2:scale(0.4,0.4)
end 

local function FadeIn(event)
   -- change the transparency of the logo so it fades in
   logo.alpha = logo.alpha + 0.0354
end

local function MoveLogo(event)
    --add the scroll speed to the x-value of Drake
    logo.y = logo.y + scrollSpeed
    
    -- make the image rotate as it moves
    logo:rotate(5)
end

-- This function makes the mole invisible and then calls the PopUpdelay function
function Hide()
    -- changing Visiblity
    Runtime:addEventListener("enterFrame", MoveLogo)
end 

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that will go to the main menu 
local function gotoMainMenu()
    composer.gotoScene( "main_menu" )
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be yellow
    display.setDefault ("background", 216/255, 198/255, 36/255)

    -- Insert the logo image
    logo = display.newImageRect("Images/CompanyLogoJohn.png", 1024, 726)
    -- resizing image
    logo:scale(0.5,0.5)

    -- set the initial x and y position of logo
    logo.x = display.contentWidth/2
    logo.y = display.contentHeight/2

    --make the logo transparent
    logo.alpha = 0

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( logo )

end -- function scene:create( event )
 
--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then       
        -- start the splash screen music
        splashSound = audio.play(bkgSound ) 

        -- set gravity
        physics.setGravity( 0, GRAVITY )

        -- calling functions 
        Fries()
        Pizza()
        Pizza2()
        Cake()
        Cake2()
        Banana2()
        Banana()
        Fries2()
        Runtime:addEventListener("enterFrame", FadeIn)
        timer.performWithDelay(2000, Hide)

        -- go to the main menu screen 
        timer.performWithDelay (3000, gotoMainMenu)
    end
end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
        -- stop the sound for this screen
        audio.stop(splashSound)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
