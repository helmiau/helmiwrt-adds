-- Copyright 2008 Yanira <forum-2008@email.de>
-- Copyright 2012 Jo-Philipp Wich <jow@openwrt.org>
-- Copyright 2122 Helmi Amirudin <helmiau.com>
-- Licensed to the public under the Apache License 2.0.

require("luci.sys")
local apply = luci.http.formvalue ("cbi.apply")
local m, s

s = Map("telegrambot", translate("TelegramBot"), translate("Telegram bot for router with firmware Lede/Openwrt. <a href=\"https://github.com/helmiau/helmiwrt-adds/blob/main/packages/net/telegrambot/README.md\">Read more instructions here</a>."))
m = s:section(TypedSection)
m.anonymous = true
m.addremove = false
enable = m:option(Flag, "enabled", translate("Enable"), translate ("Enable Bot"))
enable.value = 1
enable.value = 0
enable.default = 0
-- devicename = m:option(Value, "device_name", translate("Device Name"), translate("Default is OpenWrt Hostname."))
-- devicename.default = luci.sys.exec("uci -q get system.@system[0].hostname")
token = m:option(Value, "bot_token", translate("Bot Token"), translate("Fill with your Telegram Bot Token. Get your Bot Token by <a href=\"https://t.me/get_id_bot\">@get_id_bot</a> telegram bot."))
chatid = m:option(Value, "chat_id", translate("Telegram Chat ID"), translate("Fill your Telegram Chat ID. Get your Telegram Chat ID by using <a href=\"https://t.me/BotFather\">@BotFather</a> telegram bot."))
timeout = m:option(Value, "timeout", translate("Time Out"), translate("Time Out respone Bot in s."))
ptime = m:option(Value, "polling_time", translate("Polling Time"), translate ("Polling Time in s."))
plugins = m:option(Value, "plugins", translate("Plugins"), translate("Path to plugins directory. Default path: /usr/lib/telegrambot/plugins"))
plugins.default = '/usr/lib/telegrambot/plugins'
hlog = m:option(Value, "log_file", translate("Log File"), translate ("Path to Logfile. Default path: /tmp/telegrambot.log"))
hlog.default = '/tmp/telegrambot.log'

if apply then
        local restart = "/etc/init.d/telegrambot restart"
        luci.sys.exec(restart)
end

return s
