#define sfx_emit
/// sfx_emit(_snd, _volume, _pitch)
var _snd = argument0, _volume = argument1, _pitch = argument2;

var _snd = audio_play_sound(_snd, 0, 0);
audio_sound_gain(_snd, _volume * global.sfxVolume, 0);
audio_sound_pitch(_snd, _pitch);
return _snd;

#define mus_play
/// mus_play(_mus, _volume)
var _mus = argument0, _volume = argument1;

if (global.musCurrentMusic != _mus)
{
    if (audio_is_playing(global.musSoundIdx))
    {
        audio_stop_sound(global.musSoundIdx);
    }
    
    global.musCurrentMusic = _mus;
    global.musSoundIdx = audio_play_sound(_mus, 0, true);
    audio_sound_gain(global.musSoundIdx, _volume * global.musVolume, 0);
}

#define sfx_init_settings
global.sfxVolume = 0.75;


global.musCurrentMusic = -1;
global.musSoundIdx = -1;
global.musVolume = 0.3;
// global.musVolumeFactor = 1.0;