MessageBuilderCode = [[
MessageBuilder = {};
MessageBuilder.__index = MessageBuilder;

function MessageBuilder:new()
    local obj = {
        content = "",
        embeds = {},
        components = {},
        attachements = {},
    }
    setmetatable(obj , MessageBuilder);
    return obj;
end

function MessageBuilder:addEmbeds(embeds)
    self.embeds = embeds;
    return self
end

function MessageBuilder:addComponents(components)
    self.components = components;
    return self;
end

function MessageBuilder:setContent(text)
    self.content = text;
    return self;
end

function MessageBuilder:addAttachements(attachements)
    self.attachements = attachements;
    return self;
end

function MessageBuilder:setTTS(tts)
    self.tts = tts;
    return self;
end

function MessageBuilder:build()
    return self;
end
]]

function getMessageBuilderModule()
    return MessageBuilderCode
end