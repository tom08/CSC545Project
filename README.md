# CSC545Project

Simple Image Editor


Functionality Notes:

Eraser:
    Erases a 5x5 pixel square centered at the mouse cursor. Due to using draw(), if mouse cursor moves quicker than draw() runs, gaps occur in the erasing.

Rotate:
    Rotates the image 90 degrees clockwise. If the picture's original width is larger than our program window's height, the new bottom border of the image is cut off at the program's bottom border. The cut off portion of the rotated image is NOT lost though. It is simply not displayed.

Horizontal Flip:
    The image is flipped across the horizontal middle of the image.

Vertical Flip:
    The image is flipped across the vertical middle of the image.

Crop:
    Selects a rectangular area with the mouse and the image is reduced to only that area.

Add Phrase
    INSTRUCTIONS:
    font size:
        1 -increases 
        2 -decreases 
    arrows:
        up/down - navigates through word choices
    mouse click:
        display/remove phrase- the font and word choice settings are saved

Select Similar Pixels to Manipulate
    Use Directions:
        Button press: toggles through manipulating red channel, green channel, blue channel and off.
        Click anywhere on the image to select a pixel
        Use arrow keys or mouse wheel to add or take away from the current channel (indicated on button)

Reset:
    Reset the display to the last loaded image.

Save:
    Save the image file to a filename and location of your choosing.

Open:
    Open an image to edit.

Negative Filter:
    Turns the image into its negative.

True Grayscale Filter:
    Uses weighted values on the RGB channels to produce a grayscale image.

Simple Grayscale Filter:
    Uses equal weights on the RGB channels to produce a grayscale image.

Sepia Filter:
    Uses different weighted averages of the RGB channels to produce the new value of each RGB channel.