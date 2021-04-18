local Settings = {
	
	SmokeActivationTime = 5; -- The time from the smoke being thrown till the smoke begins to spawn
	ActiveForceTime = 0.2; -- The time in which the bodyforce object is active.
	BodyForceValues ={ -- The values which affect the projection of the Grenade
		X_Values = { -- The left and right movement in relation to the Character's position
			Min = -10; -- Minimum Possible value 
			Max = 10 -- Maximum Possible Value
		};
		Y_Values = { -- The virticle movement value
			Min = 30; -- Minimum Possible value 
			Max = 50 -- Maximum Possible Value
		};
		Z_Values = { -- The rough distance to be travled by the grenade
			Min = 25; -- Minimum Possible value 
			Max = 50 -- Maximum Possible Value
		};
	};
	SmokeValues = { -- Values which affect the smoke's appearance and behaviour
		Opacity = 0.4; -- The Transparency of the smoke (1 is opque 0 is transparent)
		RiseVelocity = 2; -- The speed which the smoke will rise
		Size_Values = {
			Start = 0; -- The starting size of the smoke
			Final = 15; -- The final size of the smoke
			Incriment = 0.2; -- The incriment which the smoke grows by
			Incriment_Delay = 0.1 -- The delay in the loop which runs the incriment (NEVER SET TO ZERO)
		};
		Lifetime = 15; -- The time which the smoke is alive for, after it has reached it's maximum size
		Color = Color3.fromRGB(255, 255, 255)	-- The Color of the smoke in RGB Values
	};
	
	
	
	
	
	
	
}

return Settings
