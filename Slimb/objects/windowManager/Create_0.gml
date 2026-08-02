window_set_size(720 * global.resolution, 480 * global.resolution);
window_center();

wasFull = false


gpu_set_texfilter(false);

game_set_speed(60, fps_real)
window_set_caption("Slimb");

// Shader stuff

my_crt = new CRT()
    .configure_ntsc(false)
    .configure_geometry({
        content_width: 480,
        content_height: 270,
        aspect_ratio: 16/9,
        zoom: global.zoomControl,
        border_width: 0.0,
        curvature: 0.1,
        do_int_scale: true
    })
    .configure_mask({
        strength: 0.8
    })
    .configure_lines({
        image_softness: 0.5,
        brightness: global.brightness + 0.5
    })
    .update_uniforms();
	
