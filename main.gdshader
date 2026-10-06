shader_type canvas_item;

global uniform vec4 colorone;
global uniform vec4 colortwo;
global uniform vec4 colorthree;
global uniform vec4 colorfour;
global uniform vec4 colorfive;
global uniform vec4 colorsix;

global uniform vec4 newcolorone;
global uniform vec4 newcolortwo;
global uniform vec4 newcolorthree;
global uniform vec4 newcolorfour;
global uniform vec4 newcolorfive;
global uniform vec4 newcolorsix;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    
    vec4 oldcolors[6] = vec4[](colorone, colortwo, colorthree, colorfour, colorfive, colorsix);
    vec4 newcolors[6] = vec4[](newcolorone, newcolortwo, newcolorthree, newcolorfour, newcolorfive, newcolorsix);
    
    float precision_threshold = 0.1; 
    
    for(int i = 0; i < 6; i++) {
        vec4 target_color = oldcolors[i];
        
        float dist = distance(tex_color.rgb, target_color.rgb);
        
        if (dist < precision_threshold) {
            tex_color.rgb = newcolors[i].rgb;
            break; 
        }
    }
    
    COLOR = tex_color;
}
