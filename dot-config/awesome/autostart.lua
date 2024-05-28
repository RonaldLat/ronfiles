local awful = require("awful")
local filesystem = require("gears.filesystem")
local config_dir = filesystem.get_configuration_dir()
-- local helpers = require("helpers")
local run = require("run")

local function autostart_apps()
  --- Compositor
  run.check_if_running("picom --experimental-backends", nil, function()
    awful.spawn("picom --experimental-backends --config " .. config_dir .. "~/.config/picom.conf", false)
  end)
  --- Music Server
  -- helpers.run.run_once_pgrep("mocicon")
  -- helpers.run.run_once_pgrep("kdeconnect-indicator")
  --- Polkit Agent
  -- helpers.run.run_once_ps(
  -- "polkit-gnome-authentication-agent-1",
  -- "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
  -- )
  --- Other stuff
  -- helpers.run.run_once_pgrep("redshift-gtk")
  -- helpers.run.run_once_grep("blueman-applet")
  -- helpers.run.run_once_grep("nm-applet")
  run.run_once_grep("feh")
end

autostart_apps()
