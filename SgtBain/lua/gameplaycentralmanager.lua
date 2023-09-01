Hooks:PostHook(GamePlayCentralManager, "start_heist_timer", SgtBain:HookName("GamePlayCentralManager", "start_heist_timer"), function(self)
	SgtBain:Log("start_heist_timer")
	SgtBain.counts = {}
end)