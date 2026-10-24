-- YASX HUB v2.6 ULTRA AMBYAR FINAL FIXED | Owner: sayangku_gacor
local OWNERS = {["sayangku_gacor"]=true, ["Sayangku_gacor"]=true, ["ilyassarifudin132-pixel"]=true}
local Lp = game.Players.LocalPlayer
local IsOwner = OWNERS[Lp.Name] or OWNERS[Lp.Name:lower()]
local MyName = Lp.DisplayName.." @"..Lp.Name

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "YASX HUB v2.6 AMBYAR",
    Author = "Owner: sayangku_gacor | "..MyName,
    Folder = "YASXHUB",
    Theme = "Dark",
    User = {Enabled = true, Anonymous = false}
})
Window:Tag({Title = IsOwner and "v2.6 ULTRA AMBYAR | OWNER 👑" or "v2.6 AMBYAR | "..Lp.Name, Color = Color3.fromHex("#30ff6a")})

local Home = Window:Tab({Title="Home", Icon="house"})
local Features = Window:Tab({Title="Features", Icon="star"})
local Egg = Window:Tab({Title="Egg", Icon="egg", Default=true})
local Music = Window:Tab({Title="Music Ambyar 🎵", Icon="music"})
local Chat = Window:Tab({Title="YASX Chat 💬", Icon="message-circle"})
local Base = Window:Tab({Title="Barn", Icon="warehouse"})
local Global = Window:Tab({Title=IsOwner and "Global Admin 👑" or "Global", Icon="shield"})
local Config = Window:Tab({Title="Config", Icon="settings"})

local AutoSteal, AutoHallow, StaySafe, UpTread, UpBase = false, false, true, false, false
local ColorFilter, SelectedEgg = "All", "All"
local SafePos = CFrame.new(0,15,0)
local HttpS = game:GetService("HttpService")
pcall(function()
    local sz = workspace:FindFirstChild("SafeZone") or workspace:FindFirstChild("SaveZone") or workspace.SpawnLocation
    if sz then SafePos = sz.CFrame + Vector3.new(0,4,0) end
end)

-- MUSIC SYSTEM FIX
local Sound = Instance.new("Sound")
Sound.Parent = game:GetService("SoundService")
Sound.Looped = true
Sound.Volume = 1
Sound.Name = "YASXMusic"
local CurrentSong = "Denny Caknan - Widodari"
local MusicList = {
    ["Denny Caknan - Widodari"] = 8808404857,
    ["Denny Caknan - Los Dol"] = 9069147657,
    ["Denny Caknan - Kartonyono Medot Janji"] = 9038874750,
    ["Denny Caknan - Satru 2"] = 9183563530,
    ["NDX AKA - Kimcil Kepolen"] = 1836683625,
    ["NDX AKA - Bojoku Digondol"] = 1843524803,
    ["NDX AKA - Sayang"] = 142295308,
    ["Guyon Waton - Perlahan"] = 1836175030,
    ["Guyon Waton - Korban Janji"] = 1810086035,
    ["Lavora - Sewates Kerjo"] = 1836151398,
    ["Lavora - Lali Rasane Tresno"] = 1843396936,
    ["Lavora - Wegah Pisah"] = 1836655026,
}

Home:Section({Title="👤 Login: "..MyName})
local Stats = Home:Paragraph({Title="YASX v2.6 ULTRA AMBYAR", Desc="Loading..."})
task.spawn(function() while task.wait(1) do pcall(function()
    Stats:SetDesc(string.format("Money: $%s | Gems: %s\nUser: %s", Lp.leaderstats.Money.Value, Lp.leaderstats.Gems.Value, MyName))
end) end end)

Features:Section({Title="Main Features"})
Features:Toggle({Title="Anti-AFK", Default=true, Callback=function(v) if v then for _,c in pairs(getconnections(Lp.Idled)) do c:Disable() end end end})
Features:Toggle({Title="Ava Stay di Save Zone 🛡️", Default=true, Callback=function(v) StaySafe=v end})
Features:Toggle({Title="Auto Upgrade Treadmill 🏃", Default=false, Callback=function(v) UpTread=v end})
Features:Toggle({Title="Auto Upgrade Base 🏠", Default=false, Callback=function(v) UpBase=v end})

Egg:Section({Title="🥚 YASX EGG STEALER v2.6"})
Egg:Toggle({Title="Auto Steal ALL Egg", Default=false, Callback=function(v) AutoSteal=v end})
Egg:Toggle({Title="Auto Steal ALL Halloween 🎃", Default=false, Callback=function(v) AutoHallow=v end})
Egg:Dropdown({Title="Jenis Hewan / Egg", Values={"All","Snowy Owl","Rhinotaur","Imp","Dragon","Halloween","Cosmic"}, Value="All", Callback=function(v) SelectedEgg=v end})
Egg:Dropdown({Title="Warna / Rarity", Values={"All","Golden","Silver","Rainbow","Cosmic","Secret"}, Value="All", Callback=function(v) ColorFilter=v end})
local QuickDisplay = Egg:Paragraph({Title="📊 Quick Bar Live", Desc="Status: Idle - Siap Steal"})

Music:Section({Title="🎵 PLAYLIST AMBYAR"})
local NowPlaying = Music:Paragraph({Title="Now Playing", Desc="Auto: Denny - Widodari 🎤"})
Music:Dropdown({Title="Denny Caknan 🎤", Values={"Denny Caknan - Widodari","Denny Caknan - Los Dol","Denny Caknan - Kartonyono Medot Janji","Denny Caknan - Satru 2"}, Value="Denny Caknan - Widodari", Callback=function(v)
    CurrentSong=v local id=MusicList[v] Sound:Stop() Sound.SoundId="rbxassetid://"..id Sound:Play() NowPlaying:SetDesc("🎵 "..v)
end})
Music:Dropdown({Title="NDX AKA 🔥", Values={"NDX AKA - Kimcil Kepolen","NDX AKA - Bojoku Digondol","NDX AKA - Sayang"}, Value="NDX AKA - Kimcil Kepolen", Callback=function(v)
    CurrentSong=v local id=MusicList[v] Sound:Stop() Sound.SoundId="rbxassetid://"..id Sound:Play() NowPlaying:SetDesc("🎵 "..v)
end})
Music:Dropdown({Title="Guyon Waton 💔", Values={"Guyon Waton - Perlahan","Guyon Waton - Korban Janji"}, Value="Guyon Waton - Perlahan", Callback=function(v)
    CurrentSong=v local id=MusicList[v] Sound:Stop() Sound.SoundId="rbxassetid://"..id Sound:Play() NowPlaying:SetDesc("🎵 "..v)
end})
Music:Dropdown({Title="Lavora 🎸", Values={"Lavora - Sewates Kerjo","Lavora - Lali Rasane Tresno","Lavora - Wegah Pisah"}, Value="Lavora - Sewates Kerjo", Callback=function(v)
    CurrentSong=v local id=MusicList[v] Sound:Stop() Sound.SoundId="rbxassetid://"..id Sound:Play() NowPlaying:SetDesc("🎵 "..v)
end})
Music:Input({Title="Custom ID Lagu", Placeholder="142295308", Callback=function(id)
    if tonumber(id) then CurrentSong="Custom ID: "..id Sound:Stop() Sound.SoundId="rbxassetid://"..id Sound:Play() NowPlaying:SetDesc("🎵 "..CurrentSong) end
end})
Music:Slider({Title="Volume", Value={Min=0, Max=10, Default=5}, Callback=function(v) Sound.Volume=v end})
Music:Button({Title="▶️ Play", Callback=function() Sound:Play() end})
Music:Button({Title="⏸️ Pause", Callback=function() Sound:Pause() end})
Music:Button({Title="⏹️ Stop", Callback=function() Sound:Stop() end})

Chat:Section({Title="💬 YASX GLOBAL CHAT"})
Chat:Paragraph({Title="Kamu: "..MyName})
local ChatDisplay = Chat:Paragraph({Title="Live Chat", Desc="Memuat..."})
local LastChatInput = ""
Chat:Input({Title="Tulis Pesan", Placeholder="Halo guys...", Callback=function(v) LastChatInput=v end})
Chat:Button({Title="KIRIM CHAT 🚀", Variant="Primary", Callback=function()
    if LastChatInput~="" then
        pcall(function() HttpS:PostAsync("https://yasx-official-default-rtdb.firebaseio.com/yasx_chat.json", HttpS:JSONEncode({name=MyName, msg=LastChatInput, time=os.date("%H:%M"), isOwner=IsOwner})) end)
        LastChatInput=""
    end
end})
task.spawn(function() while task.wait(3) do pcall(function()
    local res = game:HttpGet("https://yasx-official-default-rtdb.firebaseio.com/yasx_chat.json?orderBy=\"$key\"&limitToLast=10")
    local data = HttpS:JSONDecode(res)
    if data then local txt="" for _,v in pairs(data) do txt=txt..string.format("[%s] %s: %s\n", v.time or "??:??", v.name, v.msg) end if txt~="" then ChatDisplay:SetDesc(txt) end end
end) end end)

Base:Button({Title="Teleport ke Safe Zone 🛡️", Callback=function() Lp.Character.HumanoidRootPart.CFrame=SafePos end})
Config:Keybind({Title="Toggle UI [K]", Default="K", Callback=function() Window:Toggle() end})

-- LOGIC FIXED (BUG DI QuickDisplay SUDAH FIX)
task.spawn(function()
    while task.wait(0.4) do pcall(function()
        if AutoSteal or AutoHallow then
            for _,v in pairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") and v.Parent.Name:lower():find("egg") then
                    local eggName = v.Parent.Parent.Name or v.Parent.Name
                    local ok = true
                    if SelectedEgg~="All" and not eggName:lower():find(SelectedEgg:lower()) then ok=false end
                    if AutoHallow and not eggName:lower():find("hallow") then ok=false end
                    if ColorFilter~="All" and not eggName:lower():find(ColorFilter:lower()) then ok=false end
                    if ok then
                        local hrp = Lp.Character and Lp.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.CFrame = v.Parent.CFrame
                            task.wait(0.15)
                            fireproximityprompt(v)
                            task.wait(0.2)
                            if StaySafe then hrp.CFrame = SafePos end
                            QuickDisplay:SetDesc(string.format("Jenis: %s\nWarna: %s\nStatus: Steal ✅\nLagu: %s", eggName, ColorFilter, CurrentSong))
                        end
                    end
                end
            end
        end
    end) end
end)

task.wait(1)
Sound.SoundId="rbxassetid://8808404857"
Sound:Play()
WindUI:Notify({Title="YASX v2.6 AMBYAR FIX", Content="Loaded! Widodari Playing 🎵 Hi "..MyName, Duration=4})
