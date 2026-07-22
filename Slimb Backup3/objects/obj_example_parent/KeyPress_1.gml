/// @description Demo toggles

// Toggle main CRT pass
if keyboard_check_pressed(ord("1")) {
	if my_crt.final_pass_shader == shd_pass_crt {
		my_crt.set_shader(shd_pass_crt_raw_variant);
	} else {
		my_crt.set_shader(shd_pass_crt);
	}
}

// Toggle NTSC pass
if keyboard_check_pressed(ord("2")) {
	my_crt.configure_ntsc(not my_crt.ntsc.enabled);
}

// Toggle bloom pass
if keyboard_check_pressed(ord("3")) {
	my_crt.configure_bloom(not my_crt.bloom.enabled);
}

// Open debug overlay
if keyboard_check_pressed(ord("4")) {
	show_debug_overlay(true);
}

// Cycle horizontal mask type
if keyboard_check_pressed(ord("5")) {
	switch(my_crt.mask.sprite) {
		case spr_mask_rgbx: my_crt.mask.sprite = spr_mask_bgrx; break;
		case spr_mask_bgrx: my_crt.mask.sprite = spr_mask_gm; break;
		case spr_mask_gm: my_crt.mask.sprite = spr_mask_yb; break;
		case spr_mask_yb: my_crt.mask.sprite = spr_mask_rycb; break;
		case spr_mask_rycb: my_crt.mask.sprite = spr_mask_rmcg; break;
		case spr_mask_rmcg: my_crt.mask.sprite = spr_mask_rgbx; break;
	}
}

// Cycle shadow mask type
if keyboard_check_pressed(ord("6")) {
	if my_crt.mask.do_shadow {
		my_crt.configure_mask({do_shadow: false});
	} else if my_crt.mask.slot_strength == 0 {
			my_crt.configure_mask({slot_strength: 1.0});
	} else {
		switch(my_crt.mask.slot_height) {
			case 0: my_crt.configure_mask({slot_height: 1}); break;
			case 1: my_crt.configure_mask({slot_height: 2}); break;
			case 2: {
				my_crt.configure_mask({slot_height: 0, slot_strength: 0.0, do_shadow: true});
			}break;
		}
	}
}

// Cycle lines
if keyboard_check_pressed(ord("7")) {
	switch (my_crt.lines.min_sigma) {
		case 0.225: {
			my_crt.configure_lines({min_sigma:0.15, max_sigma: 0.3});
		} break;
		case 0.15: {
			my_crt.configure_lines({min_sigma:0.5, max_sigma: 0.5});
		} break;
		case 0.5: {
			my_crt.configure_lines({min_sigma:0.225, max_sigma: 0.5});
		} break;
	}
}

// Goto other demos
if keyboard_check_pressed(ord("8")) {
	if room == room_last {
		room_goto(rm_example_nes);
	} else {
		room_goto_next();
	}
	
}