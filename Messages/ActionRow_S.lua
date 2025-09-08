ActionRowBuilderCode = [[
ActionRowBuilder = {};
ActionRowBuilder.__index = ActionRowBuilder;

function ActionRowBuilder:new()
    local obj = {
        type = 1,
        components = {}
    }
    setmetatable(obj , ActionRowBuilder)
    return obj
end

function ActionRowBuilder:addComponents(components)
    self.components = components;
    return self;
end

function ActionRowBuilder:build()
    return self;
end
]]

function getActionRowBuilderModule()
    return ActionRowBuilderCode;
end