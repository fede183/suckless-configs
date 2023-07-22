# Creating alias
unalias connect_to_gamepad;
alias connect_to_gamepad='gamepad_id='8C:41:F2:07:02:3F';
timeout 5 bluetoothctl scan on;
bluetoothctl pair $gamepad_id;
bluetoothctl connect $gamepad_id;';