local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/magbux/BorealisUiLib/refs/heads/main/Library.Lua"))()
local Alurt = loadstring(game:HttpGet("https://raw.githubusercontent.com/azir-py/project/refs/heads/main/Zwolf/AlurtUI.lua"))()

local plr = game:GetService("Players").LocalPlayer

local admins = {7961390436}

local connections = {
	["AntiVoid"] = false,
	["ESP"] = {nil, {}};
	["Hitbox"] = {false, 16};
	["Speed"] = {false, 16};
	["JumpHeight"] = {false, 7.2};
	["SBP"] = false;
	["InfHealth"] = false;
	["AntiVoidBounciness"] = 100;
	["InfiniteJump"] = {false, false};
	["AutoClicker"] = false;
	["NewESP"] = nil
}

local conditions = {
	["Hitbox"] = {
	  ["WallCheck"] = false
	};	
	["Speed"] = {
	  ["IgnoreOnToolEquipped"] = false
	}
}

-- Create A Window (Put The Tab Name Behind The Section Name)
local Window = Library.new("CubeWare (V1.5.75)")

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

local world = Window:MakeTab("World");

world:CreateToggle({
    Name = "Entity ESP",
    Callback = function(value)

    end
})
    
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

task.spawn(function()
	if success == false then
		print(tostring(error)..". Error sent to owner...")

		local webhookcheck = is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or secure_load and "Sentinel" or KRNL_LOADED and "Krnl" or SONA_LOADED and "Sona" or "Xeno"

		local url = "https://discord.com/api/webhooks/1468609317250007146/03YxHeK46vBUkbJ0YHJqo9D2T7X8MjAxzkMMRg_LyVYzHsu0QsftFSRbRKyHkVUJqSZ4"
		local data = {
  	 		["content"] = "CubeWare Universal Error | "..tostring(error_)..", From User: "..tostring(plr.DisplayName or plr.Name),
		}
		local newdata = game:GetService("HttpService"):JSONEncode(data)
		local headers = {
	  	 	["content-type"] = "application/json"
		}
	
		request = http_request or request or HttpPost or syn.request
		local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
		request(abcdef)
	end
end)
