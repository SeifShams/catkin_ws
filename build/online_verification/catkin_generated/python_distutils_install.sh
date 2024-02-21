#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/seif/catkin_ws/src/online_verification"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/seif/catkin_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/seif/catkin_ws/install/lib/python3/dist-packages:/home/seif/catkin_ws/build/online_verification/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/seif/catkin_ws/build/online_verification" \
    "/usr/bin/python3" \
    "/home/seif/catkin_ws/src/online_verification/setup.py" \
    egg_info --egg-base /home/seif/catkin_ws/build/online_verification \
    build --build-base "/home/seif/catkin_ws/build/online_verification" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/seif/catkin_ws/install" --install-scripts="/home/seif/catkin_ws/install/bin"