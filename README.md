# defold-color
Library to modify, transform and convert colors. To use defined named colors and paletts, generate random colors and get a random palett.

Screenshot from the example/test scene.
<p align="center">
  <img src="/.github/example.png">
</p>

## Installation
To use the library in a Defold project this project has to be added as a Defold library dependency. Open the game.project file and in the Dependencies field in the Project section add:

https://github.com/Jerakin/defold-color/archive/master.zip

Or point to the ZIP file of a specific release.

# Lua API
## `color`
Convert colors between rgb, hsv, and hex

### **color.from_hex(str)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Converts a hex string into a color vector. 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; •  `str` (string) - The color in a hex format, accepts it with and without th `#`.   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It also the supports the shorthand for hex colors.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

### **color.to_hex(color)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Converts a color vector into a hex string.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4) - The color in a `vmath.vector4` format, alpha is discarded.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; •  `string` (string) - The hex string.

### **color.from_table(tbl)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Converts a table of values into a color vector. There is also a   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `color.from_table_255` that assumes values in a 0-255 format.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `tbl` (table) - The color in a `{1.0, 1.0, 1.0, 1.0}` format (alpha optional, defaults to 1).

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

### **color.to_table(color)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Transforms the color into a table. There is also a `color.to_table_255` that converts  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the values into 0-255 values.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `table` (table) - The color as a table.


### **color.from_rgba(r, g, b, a)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Converts the arguments into a color vector. There is also a `color.from_rgba_255` that assumes  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; values in a 0-255 format.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `r` (number) - The red component of the color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `g` (number) - The green component of the color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `b` (number) - The blue component of the color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `a` (number) - Optional alpha component of the color ( defualts to 1)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

### **color.from_hsv(hue, saturation, value)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Converts h, s, v values into color vector.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `hue` (number) - The hue component of the color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `saturation` (number) - The saturation component of the color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `value` (number) - The value component of the color

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

### **color.to_hsv(color)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Converts the color to a table of HSV values.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `hue` (number) - The hue component of the color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `saturation` (number) - The saturation component of the color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `value` (number) - The value component of the color

### **color.shift(color, value)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Shift the color along the color wheel.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4) The starting color to shift.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `value` (number) Percental shift (0-1) around the wheel, defaults to a random value of 1 to 2 percent.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

## `cmath`
Perform arithmetic and blend modes.

### **cmath.difference(base, blend)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Looks at the color information in each channel and subtracts the blend color from the base color.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `base` (vmath.vector4) - The base color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `blend` (vmath.vector4) - The color that will be used for the blending

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

### **cmath.screen(base, blend)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Looks at each channel’s color information and multiplies the inverse of the blend and base colors

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `base` (vmath.vector4) - The base color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `blend` (vmath.vector4) - The color that will be used for the blending

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

### **cmath.overlay(base, blend)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Multiplies or screens the colors, depending on the base color.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `base` (vmath.vector4) - The base color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `blend` (vmath.vector4) - The color that will be used for the blending

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

### **cmath.invert(color)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Inverts the color.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

### **cmath.multiply(base, blend)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Looks at the color information in each channel and multiplies the base color by the blend color.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `base` (vmath.vector4) - The base color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `blend` (vmath.vector4) - The color that will be used for the blending

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

### **cmath.add(base, blend)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Looks at the color information in each channel and adds the blend color to the base color.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `base` (vmath.vector4) - The base color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `blend` (vmath.vector4) - The color that will be used for the blending

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

### **cmath.divide(base, blend)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Looks at the color information in each channel and divides the base color with blend color.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `base` (vmath.vector4) - The base color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `blend` (vmath.vector4) - The color that will be used for the blending  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

### **cmath.subtract(base, blend)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Looks at the color information in each channel and subtracts the blend color to the base color.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `base` (vmath.vector4) - The base color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `blend` (vmath.vector4) - The color that will be used for the blending  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

### **cmath.color_dodge(base, blend)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Brighter than the Screen blend mode. Results in an intense,   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; contrasty color-typically results in saturated mid-tones and blown highlights.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**    
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `base` (vmath.vector4) - The base color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `blend` (vmath.vector4) - The color that will be used for the blending 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

### **cmath.color_burn(base, blend)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Darker than Multiply, with more highly saturated mid-tones and reduced highlights.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `base` (vmath.vector4) - The base color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `blend` (vmath.vector4) - The color that will be used for the blending  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

### **cmath.linear_dodge(base, blend)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Brighter than the Color Dodge blend mode, but less saturated and intense. (Same as `cmath.add`)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `base` (vmath.vector4) - The base color    
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `blend` (vmath.vector4) - The color that will be used for the blending  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

### **cmath.linear_burn(base, blend)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Darker than Multiply, with more highly saturated mid-tones and reduced highlights.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `base` (vmath.vector4) - The base color  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `blend` (vmath.vector4) - The color that will be used for the blending

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

## `harmony`
Create complementary colors from your base color.

### **harmony.complementary(start_color)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The complementary color is the color on the opposite side of the color wheel.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `start_color` (vmath.vector4) - The color to generate from.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `color` (vmath.vector4)

### **harmony.monochromatic(start_color)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Generate an Array of colors that are all the varieties of a single hue the  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tints, shades, and tones.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `start_color` (vmath.vector4) - The color to generate from.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `array` (vmath.vector4) - Array of Vector4 colors of length `count`

### **harmony.analogous(start_color)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; An analogous color scheme involves three hues, all of which are positioned next  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to each other on the color wheel.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `start_color` (vmath.vector4) - The color to generate from.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `array` (vmath.vector4) - The two colors that are analogous to the input.

### **harmony.split_complementary(start_color)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Generate the two colors lying on either side of the `start_color`  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (the complementary) color.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `start_color` (vmath.vector4) - The color to generate from.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `array` (vmath.vector4) - Array of the two complementary colors.


### **harmony.triadic(start_color)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Generate the two colors that are triadic color.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Triadic colors are equidistant on the color wheel. 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `start_color` (vmath.vector4) - The color to generate from.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `array` (vmath.vector4) - Array of the two colors to complement  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the `start_color` to make a triadic color scheme.

### **harmony.tetradic(start_color)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A tetrad is four colors, that is, two pairs of complementary combinations. 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `start_color` (vmath.vector4) - The color to generate from.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `colors` (table) - Array of the three colors to complement the  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; starting color to make a tetradic color scheme.

## `palette`
Contains a few palettes (with made up named), they are between 5 and 10 colors.

### **palette.random()**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Returns a random palett 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • *None*
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `colors` (table) - Table containing (`vmath.vector4`) colors of the palett.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `name` (string) - Name of the generated palette.
 
### **palette.add(name, palette)**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Returns a random palett 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **PARAMETERS**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `name` (string) - Name of the generated palette.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • `palette` (table) - Table containing (`vmath.vector4`) colors of the palett.
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **RETURN**  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; • *None*

## `w3c`
[Named web colors.](https://www.w3schools.com/colors/colors_names.asp)
