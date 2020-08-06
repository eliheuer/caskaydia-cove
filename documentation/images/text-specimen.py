# RENDER THIS DOCUMENT WITH DRAWBOT: http://www.drawbot.com
from drawBot import *
import math

# CONSTANTS
W = 1024  # Width
H = 512   # Height
M = 32    # Margin
U = 32    # Unit (Grid Unit)

# REMAP INPUT RANGE TO VARIABLE FONT AXIS RANGE
# (E.G. SINE WAVE(-1,1) to WGHT(100,900))
def remap(value, inputMin, inputMax, outputMin, outputMax):
    inputSpan  = inputMax  - inputMin   # FIND INPUT RANGE SPAN
    outputSpan = outputMax - outputMin  # FIND OUTPUT RANGE SPAN
    valueScaled = float(value - inputMin) / float(inputSpan)
    return outputMin + (valueScaled * outputSpan)

# DRAWS A GRID
def grid():
    strokeWidth(1)
    stroke(0.1)
    step_X = 0
    step_Y = 0
    increment_X = U
    increment_Y = U
    for x in range(31):
        polygon( (M+step_X, M), (M+step_X, H-M) )
        step_X += increment_X
    for y in range(15):
        polygon( (M, M+step_Y), (W-M, M+step_Y) )
        step_Y += increment_Y
    fill(None)
    rect(M, M, W-(2*M), H-(2*M))
    fill(0.9)
    stroke(None)

# NEW PAGE
def new_page():
    newPage(W, H)
    fill(0)
    rect(-2, -2, W+2, H+2)

# TEST FONT
font("../../fonts/variable/CaskaydiaCove[wght].ttf")
for axis, data in listFontVariations().items():
    print((axis, data))

#TEXT
TEXT = '''Wouldn’t everyone benefit by approching the world with the same inquisitive intensity, skepticism toward bureaucracy, openness to creativity, unselfishness in sharing accomplishments, urge to make improvments, and desire to build as those who followed the Hacker Ethic? By accepting others on the same unprejudiced basis by which computers accepted anyone who entered code into a Flexowriter? If everyone could interact with computers with the same innocent, productive, creative impulse that hackers did, the Hacker Ethic might spread through society like a benevolent ripple, and computers would indeed change the world for the better.
'''

# MAIN
new_page()
font("../../fonts/variable/CaskaydiaCove[wght].ttf")
#grid() # Toggle for grid view
fontSize(M/2.09)
fill(0.9)

fontVariations(wght=200)
textBox(TEXT, (M*1.3, M*0, M*9, M*14))
fontVariations(wght=400)
textBox(TEXT, (M*11.3, M*0, M*9, M*14))
fontVariations(wght=600)
textBox(TEXT, (M*21.3, M*0, M*9, M*14))

fill(1,0,0)
fontVariations(wght=400)
text("Extra Light",(M*1.3, M*14.6))
text("Regular",(M*11.3, M*14.6))
text("Bold",(M*21.3, M*14.6))

# SAVE THE IMAGE IN THIS SCRIPT'S DIRECTORY LOCATION
# POST-PROCESS: gifsicle -i text-specimen.gif --optimize=16 -o output.gif
saveImage("text-specimen.png")
