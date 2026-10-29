hl.config({
	dwindle = {
		preserve_split = true,
	},
	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
	},
	misc = {
		col = {
			splash = CACHYLGREEN,
		},
		middle_click_paste = false,
		enable_swallow = true,
		swallow_regex = "(kitty|ghostty|[Kk]onsole|Alacritty|gnome-terminal|xfce[0-9]?-terminal)",
		vrr = 3,
	},
	-- Render settings
	-- cm_enabled: Hyprland 0.57+ enables color management by default.
	-- This auto-detects HDMI-A-1 as wide color gamut (BT.2020) capable,
	-- but since the monitor runs at 8-bit (XRGB8888), not 10-bit (XRGB2101010),
	-- it causes a format mismatch. Chromium-based browsers (Brave, Chrome) then
	-- show a black screen → white blur when going fullscreen on HDMI-A-1.
	-- Firefox is unaffected (different rendering pipeline).
	--
	-- To re-enable color management in the future:
	--   1. Set cm_enabled = true (or remove the line)
	--   2. Add bitdepth = 10 to the HDMI-A-1 monitor in monitors.lua
	--   3. Add cm = "auto" to the HDMI-A-1 monitor in monitors.lua
	--   4. Test Brave fullscreen — if it breaks again, it's a Chromium + 10-bit bug
	--
	-- Issue first appeared: Hyprland 0.57 (Oct 2026)
	-- Works fine on: Hyprland 0.56
	render = {
		direct_scanout = 2,
		cm_enabled = false,
	},
	xwayland = {
		force_zero_scaling = true,
	},
})
