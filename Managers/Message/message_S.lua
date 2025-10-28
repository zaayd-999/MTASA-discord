function builder(data)
    local d = toJSON(data,true,"tabs");
    d = string.sub(d,2,-2);
    return d;
end

function formater(payload)
    if (type(payload) == "table") then
        return builder(payload);
    end
    return payload;
end

function sendMessage(payload,channel_id,bot_token , callback)
    local post = formater(payload);
    local endpoint = "https://discord.com/api/v10/channels/"..channel_id.."/messages";
    local options = {
        method = "POST",
        postData = post,
        headers = {
            ["Authorization"] = "Bot "..bot_token,
            ["Content-Type"] = "application/json"
        },
    };
    fetchRemote( endpoint , options , function( responseData , responseInfo )
        if tonumber(responseInfo.statusCode) == 200 then
            callback(nil, fromJSON(responseData));
        else
            callback(responseInfo, nil);
        end
    end)
end

function editMessage(messageId, payload, channel_id, bot_token, callback)
    local post = formater(payload);
    local endpoint = "https://discord.com/api/v10/channels/"..channel_id.."/messages/"..messageId
    local options = {
        method = "PATCH",
        postData = post,
        headers = {
            ["Authorization"] = "Bot "..bot_token,
            ["Content-Type"] = "application/json"
        },
    }
    fetchRemote( endpoint , options , function( responseData , responseInfo )
        if tonumber(responseInfo.statusCode) == 200 then
            callback(nil, fromJSON(responseData));
        else
            callback(responseInfo, nil);
        end
    end)
end

function deleteMessage(messageId, channel_id, bot_token, callback)
    local endpoint = "https://discord.com/api/v10/channels/"..channel_id.."/messages/"..messageId
    local options = {
        method = "DELETE",
        headers = {
            ["Authorization"] = "Bot "..bot_token,
            ["Content-Type"] = "application/json"
        },
    };
    fetchRemote( endpoint , options , function(responseData, responseInfo) 
        if tonumber(responseInfo.statusCode) == 204 then
            callback(nil, fromJSON(responseData));
        else
            callback(responseInfo, nil);
        end
    end)
end
