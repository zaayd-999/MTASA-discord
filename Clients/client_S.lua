local clientCode = [[
Client = {}
Client.__index = Client

function Client:new()
    local obj = {
        token = nil,
        connected = false
    }
    setmetatable(obj, Client)
    return obj
end

function Client:TokenIsValid(token , callback)
    local options =  {
        method = "GET",
        headers = {
            ["Authorization"] = "Bot "..token,
            ["Content-Type"] = "application/json"
        }
    } 
    fetchRemote("https://discord.com/api/v10/users/@me" , options , function(data,info)
        if(info.statusCode == 200) then
            self.token = token
            self.connected = true
        else
            self.token = nil
            self.connected = false
        end
        if callback then
            callback(self);
        end
        return self;
    end)
end
]]

function getClientModule()
    return clientCode
end
