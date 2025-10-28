AttachementBuilder = {};
AttachementBuilder.__index = AttachementBuilder;

function AttachementBuilder:new()
    local obj = {

    }
    setmetatable(obj,AttachementBuilder);
    return obj;
end

function AttachementBuilder:setName(name)
    
end

function AttachementBuilder:build()
    return self;
end