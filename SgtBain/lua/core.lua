--[[
MIT License

Copyright (c) 2023 Sgt. Alexis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
--]]
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