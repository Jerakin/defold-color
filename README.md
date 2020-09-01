# defold-color
Library to modify, transform and convert colors. To use defined named colors and paletts, generate random colors and get a random palett.


## Installation
To use the library in a Defold project this project has to be added as a Defold library dependency. Open the game.project file and in the Dependencies field in the Project section add:

https://github.com/Jerakin/defold-color/archive/master.zip

Or point to the ZIP file of a specific release.

# Lua API
## `color`
Convert colors between rgb, hsv, and hex

### **color.from_hex(str)**
Converts a hex string into a color vector. 

**PARAMETERS**
*  `str` (string) - The color in a hex format, accepts it with and without th `#`. It also the supports the shorthand for hex colors.

**RETURN**
* `color` (vmath.vector4)

### **color.to_hex(color)**
Converts a color vector into a hex string.

**PARAMETERS**
* `color` (vmath.vector4) - The color in a `vmath.vector4` format, alpha is discarded.

**RETURN**
*  `string` (string) - The hex string.

### **color.from_table(tbl)**
Converts a table of values into a color vector. There is also a `color.from_table_255` that assumes values in a 0-255 format.

**PARAMETERS**
* `tbl` (table) - The color in a `{1.0, 1.0, 1.0, 1.0}` format (alpha optional, defualts to 1).

**RETURN**
* `color` (vmath.vector4)

### **color.from_rgba(r, g, b, a)**
Converts the arguments into a color vector. There is also a `color.from_rgba_255` that assumes values in a 0-255 format.

**PARAMETERS**
* `r` (number) - The red component of the color
* `g` (number) - The green component of the color
* `b` (number) - The blue component of the color
* `a` (number) - Optional alpha component of the color ( defualts to 1)

**RETURN**
* `color` (vmath.vector4)

### **color.from_hsv(hue, saturation, value)**
Converts the a color given in the HSV format into a color vector.

**PARAMETERS**
* `hue` (number) - The hue component of the color
* `saturation` (number) - The saturation component of the color
* `value` (number) - The value component of the color

**RETURN**
* `color` (vmath.vector4)

### **color.to_hsv(color)**
Converts the a color given in the HSV format into a color vector.

**PARAMETERS**
* `color` (vmath.vector4)

**RETURN**
* `hue` (number) - The hue component of the color
* `saturation` (number) - The saturation component of the color
* `value` (number) - The value component of the color

## `cmath`
Perform arithmetic and blend modes.

### **cmath.difference(base, blend)**
Looks at the color information in each channel and subtracts the blend color from the base color.

**PARAMETERS**
* `base` (vmath.vector4) - The base color
* `blend` (vmath.vector4) - The color that will be used for the blending

**RETURN**
* `color` (vmath.vector4)

### **cmath.screen(base, blend)**
Looks at each channel’s color information and multiplies the inverse of the blend and base colors

**PARAMETERS**
* `base` (vmath.vector4) - The base color
* `blend` (vmath.vector4) - The color that will be used for the blending

**RETURN**
* `color` (vmath.vector4)

### **cmath.overlay(base, blend)**
Multiplies or screens the colors, depending on the base color.

**PARAMETERS**
* `base` (vmath.vector4) - The base color
* `blend` (vmath.vector4) - The color that will be used for the blending

**RETURN**
* `color` (vmath.vector4)

### **cmath.invert(color)**
Inverts the color.

**PARAMETERS**
* `color` (vmath.vector4)

**RETURN**
* `color` (vmath.vector4)

### **cmath.multiply(base, blend)**
Looks at the color information in each channel and multiplies the base color by the blend color.

**PARAMETERS**
* `base` (vmath.vector4) - The base color
* `blend` (vmath.vector4) - The color that will be used for the blending

**RETURN**
* `color` (vmath.vector4)

### **cmath.add(base, blend)**
Looks at the color information in each channel and adds the blend color to the base color.

**PARAMETERS**
* `base` (vmath.vector4) - The base color
* `blend` (vmath.vector4) - The color that will be used for the blending

**RETURN**
* `color` (vmath.vector4)

### **cmath.divide(base, blend)**
Looks at the color information in each channel and divides the base color with blend color.

**PARAMETERS**
* `base` (vmath.vector4) - The base color
* `blend` (vmath.vector4) - The color that will be used for the blending

**RETURN**
* `color` (vmath.vector4)

### **cmath.subtract(base, blend)**
Looks at the color information in each channel and subtracts the blend color to the base color.

**PARAMETERS**
* `base` (vmath.vector4) - The base color
* `blend` (vmath.vector4) - The color that will be used for the blending

**RETURN**
* `color` (vmath.vector4)

## `palette`
Contains a few palettes (with made up named), they are between 5 and 10 colors.

### **palette.random()**
Returns a random palett 

**PARAMETERS**
*None*

**RETURN**
* `colors` (table) - Table containing (`vmath.vector4`) colors of the palett.

## `w3c`
Named web colors.
