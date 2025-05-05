using System;
using System.Collections.Generic;
using WMPLib;

namespace AudioPlayerDll
{

    public static class AudioPlayer
    {
        private static int _chanId = 0;
        private static Dictionary<double, WindowsMediaPlayer> _channels;

        [DllExport("PlayerInit")]
        public static double PlayerInit()
        {
            _channels = new Dictionary<double, WindowsMediaPlayer>();
            Console.WriteLine("AudioPlayerDll inited");
            return 1.0;
        }


        [DllExport("ChannelCreate")]
        public static double ChannelCreate()
        {
            int num = _chanId++;
            _channels.Add(num, new WindowsMediaPlayer());
            return num;
        }

        [DllExport("ChannelSet")]
        public static double ChannelSet(double chanId, string path)
        {
            if (!_channels.ContainsKey(chanId))
            {
                return 0.0;
            }
            _channels[chanId].URL = path;
            return 1.0;
        }

        [DllExport("ChannelPlay")]
        public static double ChannelPlay(double chanId)
        {
            if (!_channels.ContainsKey(chanId))
            {
                return 0.0;
            }
            _channels[chanId].controls.play();
            return 1.0;
        }

        [DllExport("ChannelPause")]
        public static double ChannelPause(double chanId)
        {
            if (!_channels.ContainsKey(chanId))
            {
                return 0.0;
            }
            _channels[chanId].controls.pause();
            return 1.0;
        }

        [DllExport("ChannelStop")]
        public static double ChannelStop(double chanId)
        {
            if (!_channels.ContainsKey(chanId))
            {
                return 0.0;
            }
            _channels[chanId].controls.stop();
            return 1.0;
        }

        [DllExport("ChannelVolume")]
        public static double ChannelVolume(double chanId, double level)
        {
            if (!_channels.ContainsKey(chanId))
            {
                return 0.0;
            }
            _channels[chanId].settings.volume = (int)level;
            return 1.0;
        }

        [DllExport("ChannelKill")]
        public static double ChannelKill(double chanId)
        {
            if (!_channels.ContainsKey(chanId))
            {
                return 0.0;
            }
            _channels[chanId].close();
            _channels.Remove(chanId);
            return 1.0;
        }

        [DllExport("ChannelDuration")]
        public static double ChannelDuration(double chanId)
        {
            if (!_channels.ContainsKey(chanId))
            {
                return 0.0;
            }
            return _channels[chanId].currentMedia.duration;
        }

        [DllExport("ChannelPosition")]
        public static double ChannelPosition(double chanId)
        {
            if (!_channels.ContainsKey(chanId))
            {
                return 0.0;
            }
            return _channels[chanId].controls.currentPosition;
        }

        [DllExport("ChannelSetPosition")]
        public static double ChannelSetPosition(double chanId, double position)
        {
            if (!_channels.ContainsKey(chanId))
            {
                return 0.0;
            }
            _channels[chanId].controls.currentPosition = position;
            return 1.0;
        }

        [DllExport("ChannelKillAll")]
        public static double ChannelKillAll()
        {
            for (int i = 0; i < _channels.Count; i++)
            {
                _channels[i].close();
            }
            _channels.Clear();
            return 1.0;
        }
    }

}
