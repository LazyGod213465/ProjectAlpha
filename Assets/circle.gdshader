shader_type spatial;

render_mode 
    unshaded,
    blend_mix,
    cull_disabled;

uniform sampler2D magic_circle_tex;
uniform float radius = 0.45;
uniform float tex_scale = 0.895;

void fragment() {
    float dist = length(UV - vec2(0.5));
    float circle_mask = step(dist, radius);

    // Scale UV for texture size control
    vec2 scaled_uv = (UV - vec2(0.5)) / tex_scale + vec2(0.5);

    vec4 tex_color = texture(magic_circle_tex, scaled_uv);

    ALBEDO = tex_color.rgb;
    ALPHA = tex_color.a * circle_mask;
}
