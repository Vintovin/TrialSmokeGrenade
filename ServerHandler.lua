Active = nil
config = require(script.Parent.Config)


function ClearSmoke(Smk)
	if Active ~= nil then
		for i,v in pairs(Active:GetChildren()) do
			v:Destroy()
		end
		Active.Parent = script.Parent.Asset
		Active:SetAttribute("Thrown",false)
		Active = nil
	elseif Active == nil and Smk ~= nil then
		for i,v in pairs(Smk:GetChildren()) do
			v:Destroy()
		end
		Smk.Parent = script.Parent.Asset
		Smk:SetAttribute("Thrown",false)
		Active = nil
	end
end


function SetSmoke()
	local Smoke = Instance.new("Smoke")
	local Gren = Active
	local SV = config.SmokeValues
	local SizeVal = SV.Size_Values
	Active = nil
	Smoke.Parent = Gren
	Smoke.Enabled = true
	Smoke.Color = SV.Color
	Smoke.Opacity = config.SmokeValues.Opacity
	Smoke.RiseVelocity = config.SmokeValues.RiseVelocity
	for i=SizeVal.Start,SizeVal.Final,SizeVal.Incriment do
		Smoke.Size = i
		wait(SizeVal.Incriment_Delay)
	end
	wait(SV.Lifetime)
	ClearSmoke(Gren)
end

function Project()
	local BFV = config.BodyForceValues
	local BodyForce = Instance.new("BodyForce")
	BodyForce.Parent = Active
	BodyForce.Force = Vector3.new(math.random(BFV.X_Values.Min,BFV.X_Values.Max),math.random(BFV.Y_Values.Min,BFV.Y_Values.Max),math.random(BFV.Z_Values.Min,BFV.Z_Values.Max)) * Active.CFrame.LookVector
	wait(config.ActiveForceTime)
	BodyForce:Destroy()
end


function NewSmoke(Char)
	local NewSmok = script.Parent.Asset.Smoke
	if NewSmok then
		NewSmok.Parent = Char
		Active = NewSmok

		local NewWeld = Instance.new("Weld")
		NewWeld.Parent = NewSmok
		NewWeld.Part0 = Char["Right Arm"]
		NewWeld.Part1 = NewSmok
		NewWeld.C0 = CFrame.new(0, 0, 0, 0, 0, -1, 0, 0.999999881, 0, 1, 0, 0)
		NewWeld.C1 = CFrame.new(0.0653457642, -0.100176811, 1.22647071, 0, 0, -0.999999523, -1, 0, 0, 0, 0.999999762, 0)
	else
		warn("Smoke Still Ative - Wait until the smoke is no longer active")
	end

end


function RemoveSmoke(Char)
	if Char:FindFirstChild("Smoke") then
		if Char:FindFirstChild("Smoke"):GetAttribute("Thrown") == false then
			ClearSmoke()
		end
	end
end

function Throw(Char)
	if Char:FindFirstChild("Smoke") then
		if Char:FindFirstChild("Smoke"):GetAttribute("Thrown") == false then
			local Hum = Char.Humanoid
			
			local ThrowAnim = Instance.new("Animation")
			ThrowAnim.AnimationId = "rbxassetid://6697140879"
			
			local Track = Hum:LoadAnimation(ThrowAnim)
			
			Track:GetMarkerReachedSignal("Throw"):Connect(function()
				Active:SetAttribute("Thrown",true)
				Char:FindFirstChild("Smoke").Weld:Destroy()
				spawn(Project)
				wait(config.SmokeActivationTime)
				spawn(SetSmoke)
			end)
			Track:Play()
		end
	end
end


script.Parent.RemoteEvent.OnServerEvent:Connect(function(plr,Remote)
	local Char = plr.Character
	if Remote == "EQ" then
		NewSmoke(Char)
	elseif Remote == "UEQ" then
		RemoveSmoke(Char)
	elseif Remote == "Throw" then
		Throw(Char)
	end
	
	
end)
