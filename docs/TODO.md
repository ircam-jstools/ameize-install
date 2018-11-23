# Todo


## Installation

First, set-up the hostname, to be sure to select the good one.

## Jack

### Jack buffer size and sample-rate

Default value according to soundcard. In node-libpd / portaudio.
Install `libresample` to accept a sample-rate that differs from the sound driver (alsa).

### In progress: USB cards

Upmix 1 channel to stereo for stereo-only soundcards

### Jackd hung
jackd is hung sometimes (and thus not restarted). See if XRUNs are real problems (clicks) or not (libPd uses multiple small buffers any way).

```sh
systemctl status ameize-jack-daemon
 ```

## Alsa

 Use alsa-loopback to get sound from alsa too ?
```sh
sudo modprobe snd-aloop
```
See (in French)  <http://linuxmao.org/tiki-index.php?page=TUTO%20:%20ALSA%20vers%20JACK&structure=Accueil+Tutos&redirectpage=TUTO%20:%20ALSA%20vers%20JACK#cr_er_des_clients_jack_permanents_entre_ALSA_et_Jack>

We could also allow for resampling. See <http://www.alsa-project.org/main/index.php/Asoundrc>
