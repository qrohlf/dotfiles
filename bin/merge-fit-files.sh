#!/bin/bash
gpsbabel -i garmin_fit \
-f 1.fit \
-f 2.fit \
-f 3.fit \
-f 4.1.fit \
-f 4.2.fit \
-f 5.fit \
-f 6.1.fit \
-f 6.2.fit \
-f 7.fit \
-f 8.1.fit \
-f 8.2.fit \
-f 9.fit \
-f 10.fit \
-o gpx -F merged-all.gpx
