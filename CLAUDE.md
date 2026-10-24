# audioledd

System daemon (Python, GLib) making the mute LEDs follow the default
PipeWire/Pulse sink and source of the active seat session, by switching
`/sys/class/sound/ctl-led/*/mode`. See README.md for the design.

## Layout

* `audioledd`: the daemon. `./audioledd -n -v` for a dry run against the
  live system; works unprivileged against your own session.
* `audioledd.service`: systemd system unit.
* `Makefile`: `install` target used by `dh_auto_install`.
* `debian/`: native package. Build with `dpkg-buildpackage -us -uc -b`
  (output lands in `..`).

## Notes

* Don't write LED `brightness`; writing 0 removes the LED's trigger.
* Only sysfs writes need root. pactl runs as the session user
  (`PulseUser`).
* `pactl` calls emit `client` events; the event loop must ignore them or it
  feeds itself.
* Testing on real hardware changes the user's default devices and mute
  state. Restore them afterwards.
