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