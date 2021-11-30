# ! gst-launch-1.0 v4l2src device=/dev/video0 ! timeoverlay halignment=right valignment=bottom ! clockoverlay halignment=left valignment=bottom time-format="%Y/%m/%d %H:%M:%S" ! tee name=t ! queue ! autovideosink t. ! queue ! videorate ! video/x-raw,framerate=1/1 ! openh264enc ! multifilesink location=./frame%06d.png

#! gst-launch-1.0 v4l2src device=/dev/video0 ! timeoverlay halignment=right valignment=bottom ! clockoverlay halignment=left valignment=bottom time-format="%Y/%m/%d %H:%M:%S" ! tee name=t ! queue ! x264enc

# ! gst-launch-1.0 v4l2src device="/dev/video0" ! videoconvert ! autovideosink

# ! gst-launch-1.0 -v v4l2src device=/dev/video0 ! videoconvert ! videoscale ! videorate ! video/x-raw,framerate=1/5 ! jpegenc ! multifilesink location=snapshot-%05d.jpg

# ! gst-launch-1.0 -v v4l2src !  videoconvert ! videoscale ! videorate ! video/x-raw,framerate=1/5 ! x264enc ! mp4mux name=mux ! filesink location="video.mp4"  audiotestsrc ! lamemp3enc ! mux.

! gst-launch-1.0 -v v4l2src device="/dev/video0" ! videoconvert ! clockoverlay ! videoscale ! video/x-raw,width=640, height=360 ! x264enc bitrate=256 ! video/x-h264,profile=\"high\" !   mpegtsmux ! hlssink location=segment_%05d.ts target-duration=5 max-files=5
