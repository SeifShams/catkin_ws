import cv2.aruco as aruco
import cv2
import numpy as np
import os

# define dictionary and parameters for Aruco marker generation
dictionary = aruco.Dictionary_get(aruco.DICT_4X4_50)
parameters = aruco.DetectorParameters_create()

# get the current working directory
cwd = os.getcwd()

# generate and save Aruco markers with ids from 1 to 10
for i in range(1, 11):
    markerImage = np.zeros((200, 200), dtype=np.uint8)
    markerImage = aruco.drawMarker(dictionary, i, 200, markerImage, 1)
    markerFileName = os.path.join(cwd, "marker" + str(i) + ".png")
    cv2.imwrite(markerFileName, markerImage)
    print("Generated Aruco code with ID:", i, "saved as", markerFileName)