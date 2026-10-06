shader_type canvas_item;

global uniform vec4 newcolorsix;

void fragment() {
    // COLOR already holds the glyph shape (font texture * font color), so keep its alpha and recolor it
    COLOR.rgb = newcolorsix.rgb;
}
