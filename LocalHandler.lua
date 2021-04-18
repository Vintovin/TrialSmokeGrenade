UIS = game:GetService("UserInputService")
Equipped = false

UIS.InputBegan:Connect(function(key,C)
	if C == false and Equipped == true then
		if key.UserInputType == Enum.UserInputType.MouseButton1 then
			script.Parent.RemoteEvent:FireServer("Throw")
		end
	end
end)

script.Parent.Equipped:Connect(function()
	script.Parent.RemoteEvent:FireServer("EQ")
	Equipped = true
end)

script.Parent.Unequipped:Connect(function()
	script.Parent.RemoteEvent:FireServer("UEQ")
	Equipped = false
end)
