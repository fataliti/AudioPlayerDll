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
	
	static reset = function() {
		return ChannelReset(__id);
	}
	
	static destroy = function() {
		return ChannelKill(__id);
	}
	
	static setVolume = function(volume) {
		return ChannelSetVolume(__id, volume);
	}
	
	static setPosition = function(position) {
		return ChannelSetPosition(__id, position);	
	}
	
	static getSound = function() {
		return ChannelGet(__id);	
	}
	
	static getVolume = function() {
		return ChannelGetVolume(__id);
	}
	
	static getDuration = function() {
		return ChannelGetDuration(__id);	
	}
	
	static getPosition = function() {
		return ChannelGetPosition(__id);	
	}

}

