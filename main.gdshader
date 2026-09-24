shader_type canvas_item;

void fragment() {
    // Your original target and replacement
    vec4 target_0 = vec4(0.38, 0.34, 0.49, 1.0);
    vec3 new_0    = pow(vec3(0.38, 0.59, 0.40), vec3(2.2));

    // New color maps (converted from hex and gamma-corrected)
    vec4 target_1 = vec4(0.51, 0.42, 0.58, 1.0); // 826a95
    vec3 new_1    = pow(vec3(0.18, 0.27, 0.18), vec3(2.2)); // #2d452f

    vec4 target_2 = vec4(0.65, 0.50, 0.68, 1.0); // a57fad
    vec3 new_2    = pow(vec3(0.32, 0.32, 0.21), vec3(2.2)); // #525236

    vec4 target_3 = vec4(0.77, 0.58, 0.75, 1.0); // c495bf
    vec3 new_3    = pow(vec3(0.54, 0.41, 0.00), vec3(2.2)); // #8a6800

    vec4 target_4 = vec4(0.86, 0.67, 0.79, 1.0); // dcacc9
    vec3 new_4    = pow(vec3(0.77, 0.54, 0.19), vec3(2.2)); // #c48931

    vec4 target_5 = vec4(0.96, 0.77, 0.83, 1.0); // f4c4d4
    vec3 new_5    = pow(vec3(0.80, 0.71, 0.69), vec3(2.2)); // #ccb4af

    // Sequential color swapping
    if (distance(COLOR, target_0) < 0.01) {
        COLOR.rgb = new_0;
    } else if (distance(COLOR, target_1) < 0.01) {
        COLOR.rgb = new_1;
    } else if (distance(COLOR, target_2) < 0.01) {
        COLOR.rgb = new_2;
    } else if (distance(COLOR, target_3) < 0.01) {
        COLOR.rgb = new_3;
    } else if (distance(COLOR, target_4) < 0.01) {
        COLOR.rgb = new_4;
    } else if (distance(COLOR, target_5) < 0.01) {
        COLOR.rgb = new_5;
    }
}
