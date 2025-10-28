ButtonBuilderCode = [[
ButtonBuilder = {}
ButtonBuilder.__index = ButtonBuilder;



function ButtonBuilder:new()
    local obj = {
        type = 2,
        disabled = false,
    };
    setmetatable(obj , ButtonBuilder);
    return obj;
end

function ButtonBuilder:setCustomId(id)
    self.custom_id = id;
    return self;
end

function ButtonBuilder:setStyle(style)
    self.style = style;
    return self;
end

function ButtonBuilder:setLabel(label)
    self.label = label;
    return self;
end

function ButtonBuilder:setDisabled(disabled)
    self.disabled = disabled;
    return self;
end

function ButtonBuilder:setURL(url)
    self.url = url;
end

function ButtonBuilder:build()
    return self;
end

]]

function getButtonBuilderModule()
    return ButtonBuilderCode
end