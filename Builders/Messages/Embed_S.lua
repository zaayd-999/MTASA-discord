-- EmbedBuilderModule.lua
local embedBuilderCode = [[
EmbedBuilder = {}
EmbedBuilder.__index = EmbedBuilder

function EmbedBuilder:new()
    local obj = { type = "rich", fields = {} }
    setmetatable(obj, EmbedBuilder)
    return obj
end

function EmbedBuilder:setTitle(title) self.title = title; return self end
function EmbedBuilder:setDescription(desc) self.description = desc; return self end
function EmbedBuilder:setURL(url) self.url = url; return self end
function EmbedBuilder:setColor(color) self.color = color; return self end
function EmbedBuilder:setTimestamp(ts)
    self.timestamp = ts or os.date("!%Y-%m-%dT%H:%M:%S.000Z")
    return self
end
function EmbedBuilder:setFooter(text, icon_url) self.footer = { text = text, icon_url = icon_url }; return self end
function EmbedBuilder:setImage(url) self.image = { url = url }; return self end
function EmbedBuilder:setThumbnail(url) self.thumbnail = { url = url }; return self end
function EmbedBuilder:setAuthor(name, url, icon_url) self.author = { name=name, url=url, icon_url=icon_url }; return self end
function EmbedBuilder:setFields(fields) self.fields = fields; return self end
function EmbedBuilder:addField(name, value, inline)
    table.insert(self.fields, { name=name, value=value, inline=inline or false })
    return self
end
function EmbedBuilder:build()
    return self;
end
]]

function getEmbedBuilderModule()
    return embedBuilderCode
end
