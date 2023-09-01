if _G.SgtBain then
	return
end

_G.SgtBain = {
	_name = ModPath:sub(6, -2),
	_debug = false,
	messages = {
		disable_alarm = "Alarm disabled",
		disable_ai_cameras = "Cameras disabled",
		disable_electricity = "Electricity disabled",
		disable_laser = "Laser disabled",
	},
	aliases = {
		turnOffCameras = "disable_ai_cameras",
	},
	counts = {},
	limits = {
		disable_laser = {
			big = 2, -- The Big Bank
		},
	},
}

function SgtBain:Log(string)
	if not self._debug then
		return
	end
	log("[" .. self._name .. "] " .. (string or "nil"))
	if managers.chat and tweak_data.system_chat_color then
		managers.chat:_receive_message(ChatManager.GAME, self._name, (string or "nil"), tweak_data.system_chat_color)
	end
end

function SgtBain:HookName(class_name, method_name)
	return self._name .. "_" .. class_name .. "_" .. method_name
end