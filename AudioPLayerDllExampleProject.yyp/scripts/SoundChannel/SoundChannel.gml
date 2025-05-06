function SoundChannel() constructor {
	__id = ChannelCreate();
	
	static setSound = function(soundPath) {
		var s = ChannelSet(__id, soundPath);
		stop();
		return s;
	}
	
	static play = function() {
		return ChannelPlay(__id);	
	}
	
	static pause = function() {
		return ChannelPause(__id);
	}
	
	static stop = function() {
		return ChannelStop(__id);	
	}
	
	static setVolume = function(volume) {
		return ChannelVolume(__id, volume);
	}
	
	static destroy = function() {
		return ChannelKill(__id);
	}

	static reset = function() {
		return ChannelReset(__id);
	}
	
	static getSound = function() {
		return ChannelGet(__id);	
	}
	
	static getVolume = function() {
		return ChannelGetVolume(__id);
	}
	
	static getDuration = function() {
		return ChannelDuration(__id);	
	}
	
	static getPosition = function() {
		return ChannelPosition(__id);	
	}
	
	static setPosition = function(position) {
		return ChannelSetPosition(__id, position);	
	}
}

