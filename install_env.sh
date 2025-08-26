cd ~/easy_handeye2_ws/src
git clone https://github.com/liu-moon/easy_handeye2.git
git clone https://github.com/liu-moon/easy_handeye2_demo.git

cd ~/easy_handeye2_ws
rosdep install -yir --ignore-src --from-paths src
colcon build
source install/setup.bash

# first perform the calibration
ros2 launch easy_handeye2_demo calibrate.launch.py calibration_type:=eye_in_hand tracking_base_frame:=tr_base tracking_marker_frame:=tr_marker robot_base_frame:=panda_link0 robot_effector_frame:=panda_link8
ros2 launch easy_handeye2_demo calibrate.launch.py calibration_type:=eye_on_base tracking_base_frame:=tr_base tracking_marker_frame:=tr_marker robot_base_frame:=panda_link0 robot_effector_frame:=panda_link8

# then, check the result
ros2 launch easy_handeye2_demo check_calibration.launch.py calibration_type:=eye_in_hand tracking_base_frame:=tr_base tracking_marker_frame:=tr_marker robot_base_frame:=panda_link0 robot_effector_frame:=panda_link8



# run robot 添加启动RViz
ros2 launch easy_handeye2_demo robot.launch.py calibration_type:=eye_in_hand tracking_base_frame:=tr_base tracking_marker_frame:=tr_marker robot_base_frame:=panda_link0 robot_effector_frame:=panda_link8 start_rviz:=false
# run calibration
ros2 launch easy_handeye2_demo calibration.launch.py calibration_type:=eye_in_hand tracking_base_frame:=tr_base tracking_marker_frame:=tr_marker robot_base_frame:=panda_link0 robot_effector_frame:=panda_link8