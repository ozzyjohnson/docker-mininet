docker-mininet
==============

Mininet with OpenFlow and OpenVSwitch in a Docker container, for playing around.

### Usage:

Pull or build the image.

	docker run --privileged=true -it --rm ozzyjohnson/mininet

It seems like this should be doable with --cap-add rather than going fully privileged, but I haven't spent much time with it.

Run mininet with userspace vswitches.

	mn --switch user
