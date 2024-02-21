Steps to run cartogrpaher localization:
1. First run the tuggertrain simulation
roslaunch tugger_train_bringup robot.launch simulation:=true
2. Now run cartographer SLAM
roslaunch testing_cartographer tugger_train_cartographer.launch
3. Once you are happy with the map finish the slam in another terminal
rosservice call /finish_trajectory 0
4. Once the slam algorithm is finished save the last state
rosservice call /write_state "{filename: '${HOME}/Downloads/tug_test_1.bag.pbstream', include_unfinished_submaps: "true"}"
5. Now you can run the cartographer pure localization
roslaunch testing_cartographer tugger_train_localization.launch load_state_filename:=${HOME}/Downloads/tug_test.bag.pbstream

