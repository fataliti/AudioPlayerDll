# AudioPlayerDll

A lightweight GameMaker extension for playing audio files using WMPLib.
Made it for [Fatalny-Direct](https://github.com/fataliti/Fatalny-Direct)

### `PlayerInit()`
- Initializes the audio system
- Returns `1` on success
- Called automatically

### `ChannelCreate()`
- Creates a new audio channel
- Returns channel ID

### `ChannelKillAll()`
- Destroys all existing channels
- Called automatically when game close

### `ChannelSet(chanId, path)`
- Sets audio file for the channel
- `path`: Path to audio file

### `ChannelPlay(chanId)`
- Starts playback

### `ChannelPause(chanId)`
- Pauses playback

### `ChannelStop(chanId)`
- Stops playback

### `ChannelReset(chanId)`
- Clears the current audio file from channel

### `ChannelKill(chanId)`
- Destroys specific channel

### `ChannelSetVolume(chanId, volume)`
- Sets channel volume (0-100 range)

### `ChannelSetPosition(chanId, position)`
- Sets playback position in seconds

### `ChannelGet(chanId)`
- Returns path to current audio file
- Returns empty string if no file is set or channel doesn't exist

### `ChannelGetVolume(chanId)`
- Returns current volume (0-100 range)
- Returns `0` if no file is set or channel doesn't exist

### `ChannelGetDuration(chanId)`
- Returns duration of current file in seconds
- Returns `0` if no file is set or channel doesn't exist

### `ChannelGetPosition(chanId)`
- Returns current playback position in seconds
- Returns `0` if no file is set or channel doesn't exist
