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
local function on_executed(name)
	if not Utils:IsInHeist() or not managers.groupai:state():whisper_mode() then
		return
	end
	SgtBain:Log("on_executed(" .. name .. ")")
	if SgtBain.messages[name] or SgtBain.aliases[name] then
		local message = SgtBain.messages[name] or SgtBain.aliases[name] and SgtBain.messages[SgtBain.aliases[name]]
		local count = (SgtBain.counts[name] or 0) + 1
		local limit = SgtBain.limits[name] and SgtBain.limits[name][Global.game_settings.level_id] or 1
		if limit == count then
			managers.chat:send_message(ChatManager.GAME, nil, message)
		end
		SgtBain.counts[name] = count
	end
end

Hooks:PostHook(MissionScriptElement, "on_executed", SgtBain:HookName("MissionScriptElement", "on_executed"), function(self)
	on_executed(self._editor_name)
end)

Hooks:PostHook(MissionScriptElement, "client_on_executed", SgtBain:HookName("MissionScriptElement", "client_on_executed"), function(self)
	on_executed(self._editor_name)
end)