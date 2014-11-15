docker-mininet
==============

Mininet with OpenFlow and OpenVSwitch from source in a Docker container. There are lots of mininet images around, none with public Dockerfiles. Ideally, I'll build this one with other controllers and functionality suitable for more than dabbling.

### Usage:

Pull or build the image.

	docker run --privileged=true -it --rm ozzyjohnson/mininet

It seems like this should be doable with --cap-add rather than going fully privileged, but I haven't spent much time with it.

Run mininet with userspace vswitches.

	mn --switch user
