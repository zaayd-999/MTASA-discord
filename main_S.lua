local MessageBuilderCode = getMessageBuilderModule();
local EmbedBuilderCode = getEmbedBuilderModule();
local ButtonStyle = getButtonStyle();
local ButtonBuilderCode = getButtonBuilderModule();
local ActionRowBuilderCode = getActionRowBuilderModule();
--sendMessage()

loadstring(MessageBuilderCode)();
loadstring(EmbedBuilderCode)();
loadstring(ButtonBuilderCode)();
loadstring(ActionRowBuilderCode)();

addCommandHandler("senddiscord" , function(thePlayer , theCommand , messageContent)
    local embed = EmbedBuilder:new()
                :setTitle("Mate")
                :build();
    local button = ButtonBuilder:new()
            :setCustomId("A")
            :setLabel("Hello mate")
            :setStyle(ButtonStyle.Primary)
            :build();

    local actionRow = ActionRowBuilder:new()
        :addComponents({ button })
        :build();

    local message = MessageBuilder:new()
        :setContent(messageContent)
        :addEmbeds( { embed } )
        :addComponents( { actionRow } )
        :setTTS(false)
        :build();
    local channel_id = "YOUR_DISCORD_CHANNEL_ID"
    local bot_token = "YOUR_BOT_TOKEN"
    sendMessage(message , channel_id , bot_token , function(err , message)
        if (err) then 
            outputDebugString("Error while sending discord message." , 3 ,255,0,0);
        else
            outputDebugString("Message sended successfully.",0,0,255,100);
            outputDebugString(message.id , 0 , 0 , 255 , 100)
            
        end
    end)
end)