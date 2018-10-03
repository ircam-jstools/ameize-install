# Todo

## Jack buffer size

Default value according to soundcard.

## In progress: USB cards

Upmix 1 channel to stereo for stereo-only soundcards

## Alsa

 Use alsa-loopback to get sound from alsa too ?
```sh
sudo modprobe snd-aloop
```
See (in French)  <http://linuxmao.org/tiki-index.php?page=TUTO%20:%20ALSA%20vers%20JACK&structure=Accueil+Tutos&redirectpage=TUTO%20:%20ALSA%20vers%20JACK#cr_er_des_clients_jack_permanents_entre_ALSA_et_Jack>

We could also allow for resampling. See <http://www.alsa-project.org/main/index.php/Asoundrc>
## Jackd hung
jackd is hung sometimes (and thus not restarted). By the way, jack does not start in real-time mode. See
 ```sh
systemctl status ameize-jack-daemon
 ```
> Sep 18 16:41:01 ameize-01 ameize-jack-daemon.sh[372]: JACK server starting in realtime mode with priority 75
> Sep 18 16:41:01 ameize-01 ameize-jack-daemon.sh[372]: self-connect-mode is "Don't restrict self connect requests"
> Sep 18 16:41:01 ameize-01 ameize-jack-daemon.sh[372]: Cannot lock down 82287136 byte memory area (Cannot allocate memory)
> Sep 18 16:41:02 ameize-01 ameize-jack-daemon.sh[372]: creating alsa driver ... hw:0|hw:0|256|2|44100|0|0|nomon|swmeter|soft-mode|32bit
> Sep 18 16:41:02 ameize-01 ameize-jack-daemon.sh[372]: ALSA: Cannot open PCM device alsa_pcm for capture. Falling back to playback-only mode
> Sep 18 16:41:02 ameize-01 ameize-jack-daemon.sh[372]: configuring for 44100Hz, period = 256 frames (5.8 ms), buffer = 2 periods
> Sep 18 16:41:02 ameize-01 ameize-jack-daemon.sh[372]: ALSA: final selected sample format for playback: 32bit integer little-endian
> Sep 18 16:41:02 ameize-01 ameize-jack-daemon.sh[372]: ALSA: use 2 periods for playback
> Sep 18 16:41:02 ameize-01 ameize-jack-daemon.sh[372]: Cannot use real-time scheduling (RR/75)(1: Operation not permitted)
> Sep 18 16:41:02 ameize-01 ameize-jack-daemon.sh[372]: AcquireSelfRealTime error

But with starting with `sudo` (in `ameize-jack-daemon.sh`) prevents libpd from using it.

Also tried with the sticky bit `chmod +s`.

