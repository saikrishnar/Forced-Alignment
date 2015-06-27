cd scripts

python 001_audio_from_video.py /home/sirisha/Documents/Projects/GSoC/audio_extractor/video_files /home/sirisha/Documents/Projects/GSoC/audio_extractor/wave_files

cd ../audio_extractor/wave_files

for a in *.wav
do
sox $a $a silence 1 0.1 1% 1 0.7 1% : newfile : restart
done
#sox EMMA.wav data_for_ASR/out.wav silence 1 0.1 1% 1 0.7 1% : newfile : restart
