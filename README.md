# gstreamer

sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio

pkg-config --cflags --libs gstreamer-1.0

git clone https://gitlab.freedesktop.org/gstreamer/gst-docs

cd Downloads/gst-docs/examples/tutorials

gcc basic-tutorial-1.c -o basic-tutorial-1 pkg-config --cflags --libs gstreamer-1.0

./basic-tutorial-1

gst-inspect-1.0 --gst-version ->1.16

# video-frame conversion
gst-launch-1.0 -v v4l2src ! decodebin ! videoconvert ! videoscale ! videorate ! video/x-raw,framerate=1/10 ! jpegenc ! multifilesink location=snapshot-%05d.jpg

gst-launch-1.0 -v v4l2src ! videoconvert ! videoscale ! videorate ! video/x-raw,framerate=1/5 ! jpegenc ! multifilesink location=frame%01d.jpg

# frame-video conversion

gst-launch-1.0 -e multifilesrc location="frame%01d.png" caps="image/png,framerate=1/1" ! pngdec ! videoconvert ! queue ! x264enc ! queue ! mp4mux ! filesink location=image.mp4

gst-launch-1.0 v4l2src num-buffers=1 ! queue ! x264enc ! mp4mux ! filesink location=video.mp4

gst-launch-1.0 v4l2src device=/dev/video0 ! timeoverlay halignment=right valignment=bottom ! clockoverlay halignment=left valignment=bottom time-format="%Y/%m/%d %H:%M:%S" ! tee name=t ! queue ! autovideosink t. ! queue ! videorate ! video/x-raw,framerate=1/1 ! jpegenc ! multifilesink location="./frame%06d.png"


# LINKS-

1. http://4youngpadawans.com/stream-live-video-to-browser-using-gstreamer/
2. https://docs.nvidia.com/jetson/l4t/index.html#page/Tegra%20Linux%20Driver%20Package%20Development%20Guide/accelerated_gstreamer.html#wwpID0E06E0HA
3. https://gstreamer.freedesktop.org/data/doc/gstreamer/head/gst-plugins-good/html/gst-plugins-good-plugins-splitmuxsink.html
4. https://github.com/GStreamer/gst-plugins-bad/blob/master/ext/openh264/gstopenh264enc.cpp
5. https://gstreamer.freedesktop.org/documentation/additional/design/overview.html?gi-language=c
6. https://gstreamer.freedesktop.org/documentation/additional/design/overview.html?gi-language=c


# GRAPH

https://developer.ridgerun.com/wiki/index.php/How_to_generate_a_Gstreamer_pipeline_diagram_%28graph%29

