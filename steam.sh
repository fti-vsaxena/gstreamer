# ! gst-launch-1.0 v4l2src device="/dev/video0" ! videoconvert ! autovideosink

! gst-launch-1.0 -v v4l2src device=/dev/video0 ! videoconvert ! videoscale ! videorate ! video/x-raw,framerate=1/5 ! jpegenc ! multifilesink location=snapshot-%05d.jpg

#! gst-launch-1.0 v4l2src device=/dev/video0 ! timeoverlay halignment=right valignment=bottom ! clockoverlay halignment=left valignment=bottom time-format="%Y/%m/%d %H:%M:%S" ! tee name=t ! queue ! autovideosink t. ! queue ! videorate ! video/x-raw,framerate=1/1 ! x264enc ! multifilesink location=./frame%06d.png

#! gst-launch-1.0 -v v4l2src device="/dev/video0" ! videoconvert ! timeoverlay ! videoscale ! video/x-raw,width=640, height=360 ! x264enc bitrate=256 ! video/x-h264,profile=\"high\" !   mpegtsmux ! hlssink location=segment_%05d.ts target-duration=60 max-files=5

# ! gst-launch-1.0 -e v4l2src num-buffers=500 ! video/x-raw,width=320,height=240 ! videoconvert ! queue ! timeoverlay ! x264enc key-int-max=10 ! h264parse ! splitmuxsink location=segment%05d.mov max-size-time=10000000000 max-size-bytes=1000000

#! gst-launch-1.0 -e v4l2src num-buffers=500 ! video/x-raw,width=320,height=240 ! videoconvert ! queue ! timeoverlay ! x264enc key-int-max=10 ! h264parse ! splitmuxsink name=mp4mux max-size-time=1200000000000 max-size-bytes=4000000000000 location=video%05d.mov 

#! gst-launch-1.0 -e v4l2src num-buffers=500 ! video/x-raw,width=320,height=240 ! videoconvert ! queue ! timeoverlay ! x264enc key-int-max=10 ! h264parse ! splitmuxsink location=video%02d.mov max-size-time=4000000000000 max-size-bytes=0 muxer-factory=matroskamux muxer-properties="properties,streamable=true"

#read time 
#read nfiles


#! gst-launch-1.0 -v v4l2src device="/dev/video0" ! videoconvert ! timeoverlay ! videoscale ! video/x-raw,width=320, height=240 ! x264enc bitrate=256 ! video/x-h264,profile=\"high\" !   mpegtsmux ! hlssink location=segment_%05d.ts target-duration=$time max-files=$nfiles

