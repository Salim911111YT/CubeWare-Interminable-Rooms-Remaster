local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/magbux/BorealisUiLib/refs/heads/main/Library.Lua"))()
local Alurt = loadstring(game:HttpGet("https://raw.githubusercontent.com/azir-py/project/refs/heads/main/Zwolf/AlurtUI.lua"))()

local plr : Player = nil
local bad_executor = false

if cloneref then
	plr = cloneref(game:GetService("Players")).LocalPlayer
else
	plr = game:GetService("Players").LocalPlayer

	if bad_executor == false then
		bad_executor = true
		Alurt.CreateNode({
			Name = "CubeWare",
			Content = "Due to your executor NOT supporting some function (attempt to 'clonerf'), you won't have access to much modules."
			Length = 20,
			Image = "rbxassetid://0",
			BarColor = Color3.fromRGB(75, 75, 75)
		})
	end
end

local connections = {
	["EntityESP"] = {
		["1"] = nil,
		["2"] = nil
	}
}

-- Create A Window (Put The Tab Name Behind The Section Name)
local Window = Library.new("CubeWare | Interminable Rooms REWRITE")

-- Create A Tab
local success, error_ = pcall(function()
	task.spawn(function()
		game:GetService("UserInputService").InputBegan:Connect(function(key)
  			if key.KeyCode == Enum.KeyCode.RightShift then
				pcall(function()
					Window:toggle()
				end)
	        end
   		end)
	end)
end)

local world = Window:MakeTab("Main");

world:CreateToggle({
    Name = "Entity Notifier",
    Callback = function(value)
		if value then
			connections["EntityESP"]["1"] = workspace["Entities"].ChildAdded:Connect(function(child)
				Alurt.CreateNode({
					Title = "Entity ESP",
					Content = tostring(child.Name).." has spawned!",
					Length = 5,
					Image = "rbxassetid://0",
					BarColor = Color3.fromRGB(75, 75, 75)
				})
			end)

			connections["EntityESP"]["2"] = workspace["Entities"].ChildRemoved:Connect(function(child)
				Alurt.CreateNode({
					Title = "Entity ESP",
					Content = tostring(child.Name).." has despawned!",
					Length = 5,
					Image = "rbxassetid://0",
					BarColor = Color3.fromRGB(75, 75, 75)
				})
			end)
		else
			for _, v in pairs(connections["EntityESP"]) do
				if v then
					v:Disconnect()
					v = nil
				end
			end
		end
    end
})

if hookmetamethod then
	world:AddButton({
		Name = "Client Anti-Kick",
		Callback = function()
			if hookmetamethod then
				hookmetamethod(game, "__namecall", function(self, ...)
    				local methode = getnamecallmethod()
    				local args = ...

    				if string.lower(methode) == "kick" then
        				pcall(function()
							Alurt.CreateNode({
								Title = "Anti Kick",
								Content = "Dodged Client Sided Kick with message: "..tostring(unpack(args)),
								Audio = "rbxassetid://0",
								Length = 10,
								Image = "rbxassetid://0",
								BarColor = Color3.fromRGB(75, 75, 75)
							})
						end)
						
       					return
   					end
				end)
			else
				warn("Doesn't support 'hookmetamethod'")
			end
		end,
	})
end
    
task.spawn(function()
	pcall(function()
		local notif1 = Alurt.CreateNode({
   			Title = "Cubeware",
   		 	Content = "Cubeware has been loaded!",
   		 	Audio = "rbxassetid://118797914122839",
    		Length = 4,
   			Image = "rbxassetid://0", 
    		BarColor = Color3.fromRGB(75, 75, 75)
		})
	end)
end)
