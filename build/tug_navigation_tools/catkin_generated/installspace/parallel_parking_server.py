#!/usr/bin/env python3
import rospy
from nav_msgs.msg import MapMetaData
from nav_msgs.msg import OccupancyGrid
#from math import radians, degrees
import math
from actionlib_msgs.msg import *
from geometry_msgs.msg import Pose
from tf.transformations import euler_from_quaternion, quaternion_from_euler
import numpy as np
from tug_navigation_tools.srv import *


map_array = []

map_array_edited = []
for i in range(1984):
   columns=[]
   for j in range(1984):
       columns.append((255,255,255))
   map_array_edited.append(columns)
   
map_width = 0 # in pixel
map_height = 0 # in pixel
map_resolution = 0
nearest_x_pos_px = 0 # nearest x-position of the pixel in free space
nearest_y_pos_px = 0 # nearest y-position of the pixel in free space
points_on_circle = []
wall_distance = 0.3 # Abstand zur Wand in Metern
EiS_broadth = 1 # broadth of the Eisenschwein
origin_x = -50 # offset in m 
origin_y = -50 # offset in m


# finds the nearest pixel of the map in free space (neither occupied nor undefined) relative to the pixel defined by x_pixels, y_pixels
def find_nearest_border_point(x_pixel, y_pixel):
	print("find_nearest_border_point started: x_pixel="+str(x_pixel)+", y_pixel="+str(y_pixel))
	global map_array_edited, map_width

	min_dist_x = -1
	min_dist_y = -1

	counter = 0
	print('err_0')
	if free_pixel(x_pixel, y_pixel):
		print('err_1')
		# the starting point itself already lies in free space:
		min_dist_x = x_pixel
		min_dist_y = y_pixel
	else:
		while counter<=map_width:
			counter = counter + 1
			print("counter: "+str(counter)+" map_length: "+str(map_width))
			pixel_is_free_x_pos = free_pixel(x_pixel+counter, y_pixel)
			if pixel_is_free_x_pos:
				# store the so far found shortest distance:
				min_dist_x = x_pixel+counter
				min_dist_y = y_pixel
				break
			pixel_is_free_x_neg = free_pixel(x_pixel-counter, y_pixel)
			if pixel_is_free_x_neg:
				# store the so far found shortest distance:
				min_dist_x = x_pixel-counter
				min_dist_y = y_pixel
				break
			pixel_is_free_y_pos = free_pixel(x_pixel, y_pixel+counter)
			if pixel_is_free_y_pos:
				# store the so far found shortest distance:
				min_dist_x = x_pixel
				min_dist_y = y_pixel+counter    		
				break
			pixel_is_free_y_neg = free_pixel(x_pixel, y_pixel-counter)
			if pixel_is_free_y_neg:
				# store the so far found shortest distance:
				min_dist_x = x_pixel
				min_dist_y = y_pixel-counter
				break

		if (counter<=map_width) and (counter>1):
			# at least one point in lying in free space has been found, now the closest point to the desired position has to be found    
			radius = counter-1
			while(True): # start of a do-while-loop
				# check the pixels lying on the next smaller radius
				found_elements = circular_search(radius, x_pixel, y_pixel)
				if found_elements != (-1,-1):
					# at least one point has been found	
					(min_dist_x, min_dist_y) = found_elements
					radius = radius -1
				else:
					# no new point has been found, the last known point therefore must be the point in free space with the shortest distance to our starting point
					break # end condition of do-while-loop fulfilled
	print("find_nearest_border_point returning: x="+str(min_dist_x)+" y="+str(min_dist_y))
	return (min_dist_x, min_dist_y)



# based on the circular drawing method by Jesko find at least one pixel in free space
def circular_search(radius, x0, y0):
	print("circular_search started: x0="+str(x0)+", y0="+str(y0)+", radius="+str(radius))
	t1 = radius / 16
	x = radius
	y = 0
	elements_found = (-1,-1)
    
	while y <= x:
		if (free_pixel(x0 + x, y0 + y)):
			elements_found = (x0 + x, y0 + y)
			break
		if (free_pixel(x0 - x, y0 + y)):
			elements_found = (x0 - x, y0 + y)
			break
		if (free_pixel(x0 + x, y0 - y)):
			elements_found = (x0 + x, y0 - y)
			break
		if (free_pixel(x0 - x, y0 - y)):
			elements_found = (x0 - x, y0 - y)
			break
		if (free_pixel(x0 + y, y0 + x)):
			elements_found = (x0 + y, y0 + x)
			break
		if (free_pixel(x0 - y, y0 + x)):
			elements_found = (x0 - y, y0 + x)
			break
		if (free_pixel(x0 + y, y0 - x)):
			elements_found = (x0 + y, y0 - x)
			break
		if (free_pixel(x0 - y, y0 - x)):
			elements_found = (x0 - y, y0 - x)
			break
		y = y + 1
		t1 = t1 + y
		t2 = t1 - x
		if t2 >= 0:
			t1 = t2
			x = x - 1 
	return elements_found


# constructs the new position and orientation of the Eisenschwein based on x_pixel and y_pixel as well as their nearest pixel in free space
def construct_new_position(x_origin, y_origin, x_border, y_border):
	global map_resolution, wall_distance, EiS_broadth, origin_x, origin_y
	
	print
	
	# transform pixel to meter		
	x_origin_m = x_origin*map_resolution
	y_origin_m = y_origin*map_resolution
	x_border_m = x_border*map_resolution
	y_border_m = y_border*map_resolution
	
	x_delta_m = x_border_m - x_origin_m
	y_delta_m = y_border_m - y_origin_m
	
	distance = math.sqrt(pow(x_delta_m,2)+pow(y_delta_m,2)) + EiS_broadth/2 + wall_distance

	desired_angle = math.acos(x_delta_m/math.sqrt(pow(x_delta_m,2) + pow(y_delta_m,2))) # rad	
	if y_delta_m < 0:
		desired_angle = -desired_angle

	# calculate the x position
	desired_x_pos = x_origin_m + origin_x + math.cos(desired_angle)*distance

	# calculate the y position
	desired_y_pos = y_origin_m + origin_y + math.sin(desired_angle)*distance
	
	# calculate the angle:	
	desired_angle = desired_angle - np.pi/2 # rad
	print("New position: x="+str(desired_x_pos)+", y="+str(desired_y_pos)+", angle="+str(desired_angle))
	return (desired_x_pos, desired_y_pos, desired_angle)



# checks if the given pixel is in free space
def free_pixel(x_pixel, y_pixel):
	print('start free pixel: '+str(x_pixel)+', '+str(y_pixel))
	if get_array_value(x_pixel, y_pixel)==0:
		pixel_is_free = True
	else:
		pixel_is_free = False
	print("free_pixel: x_pixel="+str(x_pixel)+" y_pixel="+str(y_pixel)+" free? "+str(pixel_is_free))
	return pixel_is_free



# get the value of the map by an x and y value
def get_array_value(x_pixel, y_pixel):
	global map_array, map_width
	return map_array[y_pixel*map_width + x_pixel]



# get the current map and its metadata
def map_loader():
	global map_subscriber, map_metadata_subscriber
	map_subscriber = rospy.Subscriber('map', OccupancyGrid, map_callback)
	map_metadata_subscriber = rospy.Subscriber('map_metadata', MapMetaData, map_metadata_callback)



# store the map
def map_callback(received_data):
	global map_array, map_array_edited, map_subscriber, map_metadata_subscriber
	map_array = received_data.data
	print("Map is stored")
	print("array length: "+str(len(map_array)))
	map_subscriber.unregister()
	print("[INFO] map topic now unregistered")



# store the maps metadata
def map_metadata_callback(received_data):
	global map_resolution, map_width, map_height, map_subscriber, map_metadata_subscriber
	map_resolution = received_data.resolution
	map_width = received_data.width
	map_height = received_data.height
	print('Map resolution in pixels: width '+str(map_width)+'px, height '+str(map_height)+'px')
	print('Map resolution in meters: width '+str(map_width*map_resolution)+'m, height '+str(map_height*map_resolution)+'m')
	map_metadata_subscriber.unregister()
	print("[INFO] map_metadata topic now unregistered")



def handle_get_parking_position_command(req):
	print('handle_get_parking_position_command')
	global map_array_edited, map_resolution, wall_distance

	x_pixel = int(req.x)
	y_pixel = int(req.y)
	wall_distance = float(req.distance)

	nearest_border_point = find_nearest_border_point(x_pixel, y_pixel)

	if nearest_border_point != (-1,-1):
		(nearest_point_x_px,nearest_point_y_px) = nearest_border_point
		print("Nearest position found, located at x:"+ str(nearest_point_x_px) +", y: "+str(nearest_point_y_px))
		
		valid_position_found = True
		
		# check if the found position is identical with the original position
		if (nearest_point_x_px==x_pixel)&(nearest_point_y_px==y_pixel):
			# then the given position already lies in free space and can be reached directly:
			(new_xGoal, new_yGoal, new_aGoal) = (x_pixel*map_resolution+origin_x, y_pixel*map_resolution+origin_y, 0)
		else:
			# otherwise the new position has to be determined, based on the found border point and the original position:
			(new_xGoal, new_yGoal, new_aGoal) = construct_new_position(x_pixel, y_pixel, nearest_point_x_px, nearest_point_y_px)
		
	else:
		print("No nearest position found")
		valid_position_found = False

	goal_pose = Pose()
	q = quaternion_from_euler(0, 0, new_aGoal)
	print('new_xGoal: '+str(new_xGoal)+' new_yGoal: '+str(new_yGoal)+' new_aGoal: '+str(new_aGoal))
	# set up the parameters
	goal_pose.position.x = new_xGoal
	goal_pose.position.y = new_yGoal
	goal_pose.position.z = 0
	goal_pose.orientation.x = q[0]
	goal_pose.orientation.y = q[1]
	goal_pose.orientation.z = q[2]
	goal_pose.orientation.w	= q[3]
	goal_response = parking_positionResponse(new_parking_position=goal_pose, position_found=valid_position_found)
	print(str(goal_response))
	return goal_response



def get_parking_position_server():    
	rospy.init_node('get_parking_position', anonymous=False)
	
	map_loader()
	
	srv_get_parking_pos = rospy.Service('get_parking_position', parking_position, handle_get_parking_position_command)
	print("get_parking_position server started")
	rospy.spin()



if __name__ == '__main__':
	get_parking_position_server()
