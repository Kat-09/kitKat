shader_type canvas_item;

// Got this shader from this site: https://bun3d.com/tutorials/misc/godot_blur_shader/
// And this https://youtu.be/Z2o6IfmK61A

uniform float blur_amount : hint_range(0.0, 5.0) = 1.5;
uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;

void fragment() {
	vec3 result = textureLod(screen_texture, SCREEN_UV, blur_amount).rgb;
	COLOR.rgb = result;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
