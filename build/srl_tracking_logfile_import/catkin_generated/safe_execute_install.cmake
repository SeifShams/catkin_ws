execute_process(COMMAND "/home/seif/catkin_ws/build/srl_tracking_logfile_import/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/seif/catkin_ws/build/srl_tracking_logfile_import/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
