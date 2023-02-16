if !focused return;
if !keyboard_check(vk_control) return;
if !clipboard_has_text() return;

keyboard_string += clipboard_get_text();