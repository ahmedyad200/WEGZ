--[[

]]

function download_to_file(url, file_name)
  -- print to server
  -- print("url to download: "..url)
  -- uncomment if needed
  local respwegz = {}
  local options = {
    url = url,
    sink = ltn12.sink.table(respwegz),
    redirect = true
  }

  -- nil, code, headers, status
  local response = nil

  if url:starts('https') then
    options.redirect = false
    response = {https.request(options)}
  else
    response = {http.request(options)}
  end

  local code = response[2]
  local headers = response[3]
  local status = response[4]

  if code ~= 200 then return nil end

  file_name = file_name or get_http_file_name(url, headers)

  local file_path = "data/"..file_name
  -- print("Saved to: "..file_path)
	-- uncomment if needed
  file = io.open(file_path, "w+")
  file:write(table.concat(respwegz))
  file:close()

  return file_path
end
function run_command(str)
  local cmd = io.popen(str)
  local result = cmd:read('*all')
  cmd:close()
  return result
end
function string:isempty()
  return self == nil or self == ''
end

-- Returns true if the string is blank
function string:isblank()
  self = self:trim()
  return self:isempty()
end

-- DEPRECATED!!!!!
function string.starts(String, Start)
  -- print("string.starts(String, Start) is DEPRECATED use string:starts(text) instead")
  -- uncomment if needed
  return Start == string.sub(String,1,string.len(Start))
end

-- Returns true if String starts with Start
function string:starts(text)
  return text == string.sub(self,1,string.len(text))
end

local getUser = function(user_id,cb)
tdcli_function({ID = "GetUser",user_id_ = user_id},cb,nil)
end

Bot_Api = 'https://api.telegram.org/bot'.. Token
function send_inline(chat_id,text,keyboard,markdown)
local url = Bot_Api
if keyboard then
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=html&reply_markup='..URL.escape(json:encode(keyboard))
else
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=HTML'
end
if markdown == 'md' or markdown == 'markdown' then
url = url..'&parse_mode=Markdown'
elseif markdown == 'html' then
url = url..'&parse_mode=HTML'
end
return https.request(url)
end








function lock_photos(msg)
if not msg.Director then 
return "↯ *│* هذا الامر يخص {المدير,المنشئ,المطور} فقط  \n"
end
redis:set(wegz.."getidstatus"..msg.chat_id_, "Simple")
return  "↯ أهلا عزيزي "..msg.TheRankCmd.."\n↯ تم تعطيل الايدي بالصوره  \n" 
end 
function unlock_photos(msg)
if not msg.Director then
return "↯ هذا الامر يخص {المدير,المنشئ,المطور} فقط  \n"
end
redis:set(wegz.."getidus"..msg.chat_id_, "Photo")
return  "↯ أهلا عزيزي "..msg.TheRankCmd.."\n↯ تم تفعيل الايدي بالصوره \n" 
end
function cmds_on(msg)
if not msg.Creator then return "↯ هذا الامر يخص {المنشئ,المطور} فقط  \n"
end
redis:set(wegz..'lock:kara:'..msg.chat_id_,'on')
return "↯ أهلا عزيزي "..msg.TheRankCmd.."\n↯ تم تعطيل الرفع في المجموعه \n"
end
function cmds_off(msg)
if not msg.Creator then return "↯ هذا الامر يخص {المنشئ,المطور} فقط  \n"
end
redis:set(wegz..'lock:kara:'..msg.chat_id_,'off')
return "↯ أهلا عزيزي "..msg.TheRankCmd.."\n↯ تم تفعيل الرفع في المجموعه \n"
end

function lockjoin(msg)
if not msg.Admin then return "↯ *│* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n"
end
redis:set(wegz..'lock:join:'..msg.chat_id_,true)
return "*↯ أهلا عزيزي *"..msg.TheRankCmd.."*\n↯ تم قفل الدخول بالرابط \n*" 

end
function unlockjoin(msg)
if not msg.Admin then return "↯ هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n"
end
redis:del(wegz..'lock:join:'..msg.chat_id_)
return "*↯ أهلا عزيزي *"..msg.TheRankCmd.."*\n↯ تم فتح الدخول بالرابط \n*" 
end


local function iwegz(msg,MsgText)

Channel = redis:get(wegz..'setch') or katrenno
--JoinChannel
function is_JoinChannel(msg)
if redis:get(wegz..'joinchnl') then
local url  = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..msg.sender_user_id_)
if res ~= 200 then
end
Joinchanel = json:decode(url)
if not GeneralBanned((msg.adduser or msg.sender_user_id_)) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not msg.SudoUser then
function name(arg,data)
bd = '↯ اسمك  ('..(data.first_name_ or '')..')\n↯ معرفك (@'..(data.username_ or '')..')\n\n↯ اشترك بالقناه اولا \n↯ ثم ارجع استخدم الامر.'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'اشترك بالقناه .',url='https://telegram.me/'..Channel}}}   
send_inline(msg.chat_id_,bd,keyboard,'html')
end
getUser(msg.sender_user_id_,name)
else
return true
end
else
return true
end
end
if msg.type ~= 'pv' then

if MsgText[1] == "تفعيل" and not MsgText[2] then
redis:set(wegz.."getidstatus"..msg.chat_id_, "Photo")
redis:set(wegz..'lock:kara:'..msg.chat_id_,'off')
return modadd(msg)  
end

if MsgText[1] == "تعطيل" and not MsgText[2] then
return modrem(msg) 
end






if MsgText[1] == "تفعيل ال بالصوره" and not MsgText[2] then
return unlock_photos(msg)  
end
if MsgText[1] == "تعطيل الايدي بالصوره" and not MsgText[2] then
return lock_photos(msg) 
end
if MsgText[1] == "تعطيل الرفع" and not MsgText[2] then
return cmds_on(msg)  
end
if MsgText[1] == "تفعيل الرفع" and not MsgText[2] then
return cmds_off(msg) 
end

if MsgText[1] == "قفل الدخول بالرابط" and not MsgText[2] then
return lockjoin(msg)  
end
if MsgText[1] == "فتح الدخول بالرابط" and not MsgText[2] then
return unlockjoin(msg) 
end

end


if msg.type ~= 'pv' and msg.GroupActive then 

if MsgText[1] == 'شحن' and MsgText[2] then
if not msg.SudoUser then return "♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
if tonumber(MsgText[2]) > 0 and tonumber(MsgText[2]) < 1001 then
local extime = (tonumber(MsgText[2]) * 86400)
redis:setex(wegz..'ExpireDate:'..msg.chat_id_, extime, true)
if not redis:get(wegz..'CheckExpire::'..msg.chat_id_) then 
redis:set(wegz..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿\n🕵🏼️‍♀️│في مجموعه  » »  '..redis:get(wegz..'group:name'..msg.chat_id_))
else
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│عزيزي المطور ✋🏿\n👨🏻‍🔧│شحن الاشتراك يكون ما بين يوم الى 1000 يوم فقط 🍃')
end 
return false
end

if MsgText[1] == 'الاشتراك' and MsgText[2] then 
if not msg.SudoUser then return "♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
if MsgText[2] == '1' then
redis:setex(wegz..'ExpireDate:'..msg.chat_id_, 2592000, true)
if not redis:get(wegz..'CheckExpire::'..msg.chat_id_) then 
redis:set(wegz..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `30 يوم`  *(شهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم تفعيل الاشتراك  👍🏿\n📆│ الاشتراك » `30 يوم`  *(شهر)*')
end
if MsgText[2] == '2' then
redis:setex(wegz..'ExpireDate:'..msg.chat_id_,7776000,true)
if not redis:get(wegz..'CheckExpire::'..msg.chat_id_) then 
redis:set(wegz..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `90 يوم`  *(3 اشهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `90 يوم`  *(3 اشهر)*')
end
if MsgText[2] == '3' then
redis:set(wegz..'ExpireDate:'..msg.chat_id_,true)
if not redis:get(wegz..'CheckExpire::'..msg.chat_id_) then 
redis:set(wegz..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `مفتوح`  *(مدى الحياة)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `مفتوح`  *(مدى الحياة)*')
end 
return false
end


if MsgText[1] == 'الاشتراك' and not MsgText[2] and msg.Admin then
if not msg.Admin then return "♦️*│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
local check_time = redis:ttl(wegz..'ExpireDate:'..msg.chat_id_)
if check_time < 0 then return '*مـفـتـوح *🎖\n✓' end
year = math.floor(check_time / 31536000)
byear = check_time % 31536000 
month = math.floor(byear / 2592000)
bmonth = byear % 2592000 
day = math.floor(bmonth / 86400)
bday = bmonth % 86400 
hours = math.floor( bday / 3600)
bhours = bday % 3600 
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if tonumber(check_time) > 1 and check_time < 60 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..sec..'* ثانيه'
elseif tonumber(check_time) > 60 and check_time < 3600 then
remained_expire = '💳│`باقي من الاشتراك ` » » '..min..' *دقيقه و * *'..sec..'* ثانيه'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 31536000 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..year..'* سنه و *'..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه' end
return remained_expire
end


if MsgText[1] == "المجموعه" then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
GetFullChat(msg.chat_id_,function(arg,data)
local GroupName = (redis:get(wegz..'group:name'..msg.chat_id_) or '')
redis:set(wegz..'linkGroup'..msg.chat_id_,(data.invite_link_ or ""))
return sendMsg(msg.chat_id_,msg.id_,
"↯ ❪ مـعـلومـات الـمـجـموعـه ❫\n\n"
.."*↯ * عدد الأعضاء ⇜ ❪ *"..data.member_count_.."* ❫"
.."\n*↯ * عدد المحظورين ⇜ ❪ *"..data.kicked_count_.."* ❫"
.."\n*↯ * عدد المشرفين ⇜ ❪ *"..data.administrator_count_.."* ❫"
.."\n*↯ * ايدي المجموعه ⇜ ❪"..msg.chat_id_.."❫"
.."\n\n↯ اسم المجموعه ⇜ ❪  ["..FlterName(GroupName).."]("..(data.invite_link_ or "")..")  ❫\n"
)
end,nil) 
return false
end

if MsgText[1] == "التفاعل" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="active"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="active"})
end  
return false
end

if MsgText[1] == "منع" then 
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return AddFilter(msg, MsgText[2]) 
end

if MsgText[1] == "الغاء منع" then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return RemFilter(msg, MsgText[2]) 
end

if MsgText[1] == "قائمه المنع" then 
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return FilterXList(msg) 
end

if MsgText[1] == "الحمايه" then 
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return settingsall(msg) 
end

if MsgText[1] == "الاعدادات" then 
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return settings(msg) 
end

if MsgText[1] == "الوسائط" then 
if not msg.Admin then return "↯ *│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return media(msg) 
end

if MsgText[1] == "الادمنيه" then 
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return GetListAdmin(msg) 
end

if MsgText[1] == "تاك" then
if not msg.Admin then return "↯ هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 100
},function(ta,taha)
local t = "\n قائمة الاعضاء \n——————\n"
x = 0
local list = taha.members_
for k, v in pairs(list) do
users = redis:get(wegz..'user_names:'..v.user_id_) or v.user_id_
x = x + 1
t = t..""..x.." - {["..users.."](tg://user?id="..v.user_id_..")} \n"
end
send_msg(msg.chat_id_,t,msg.id_)
end,nil)
end

if (MsgText[1] == "نذار" and is_JoinChannel(msg)) then 
if not msg.Admin then return "↯ هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "تاك للكل" then 
if not msg.Admin then return "↯ هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "المنشى الاساسي" then 
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return MONSEBOT(msg) 
end

if MsgText[1] == "المدراء" then 
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return ownerlist(msg) 
end

if MsgText[1] == "المنشئ الاساسي" then 
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return Hussainlist(msg) 
end

if MsgText[1] == "المميزين" then 
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return whitelist(msg) 
end


if MsgText[1] == "صلاحياته" then 
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
Get_Info(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
if MsgText[1] == "صلاحياتي" then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Get_Info(msg,msg.chat_id_,msg.sender_user_id_)
end  
end
if MsgText[1] == "صلاحياته" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if tonumber(msg.reply_to_message_id_) == 0 then 
local username = MsgText[2]
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
return sendMsg(msg.chat_id_,msg.id_,'↯ المعرف غير صحيح \n')   
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
return sendMsg(msg.chat_id_,msg.id_,'↯ هاذا معرف قناة \n')   
end      
Get_Info(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end
if MsgText[1] == "فحص البوت" then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. msg.chat_id_ ..'&user_id='.. wegz..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end 
return sendMsg(msg.chat_id_,msg.id_,'\n↯ ًاهلا عزيزي البوت هنا ادمن بالقروب \n↯ وصلاحياته هي ↓ \nــــــــــــــــــــــــــــــــ𖣐𖣐𖣐ـــــــــــــــــــــــــ\n↯ تغير معلومات المجموعه ↞ ❪ '..info..' ❫\n↯ حذف الرسائل ↞𖣐 ❪ '..delete..' ❫\n↯ حظر المستخدمين ↞𖣐 ❪ '..restrict..' ❫\n↯ دعوة مستخدمين ↞𖣐 ❪ '..invite..' ❫\n↯ تثبيت الرسائل ↞𖣐 ❪ '..pin..' ❫\n↯ اضافة مشرفين جدد ↞𖣐 ❪ '..promote..' ❫\n\n↯ ملاحضه » علامة ❪  ꪜ ❫ تعني لديه الصلاحية وعلامة ❪ ✘ ❫ تعني ليس ليديه الصلاحيه')   
end
end
end

if MsgText[1] == "تثبيت" and msg.reply_id then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
local GroupID = msg.chat_id_:gsub('-100','')
if not msg.Director and redis:get(wegz..'lock_pin'..msg.chat_id_) then
return "لا يمكنك التثبيت الامر مقفول من قبل الاداره ."
else
tdcli_function({
ID="PinChannelMessage",
channel_id_ = GroupID,
message_id_ = msg.reply_id,
disable_notification_ = 1},
function(arg,data)
if data.ID == "Ok" then
redis:set(wegz..":MsgIDPin:"..msg.chat_id_,msg.reply_id)
return sendMsg(msg.chat_id_,msg.id_,"↯ً أهلا عزيزي "..msg.TheRankCmd.." \n↯ تم تثبيت الرساله \n✓")
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ ًعذرا لا يمكنني التثبيت .\n↯ لست مشرف او لا املك صلاحيه التثبيت \n')    
end
end,nil)
end
return false
end

if MsgText[1] == "الغاء التثبيت" then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not msg.Director and redis:get(wegz..'lock_pin'..msg.chat_id_) then
return "لا يمكنك الغاء التثبيت الامر مقفول من قبل الاداره"
else
local GroupID = msg.chat_id_:gsub('-100','')
tdcli_function({ID="UnpinChannelMessage",channel_id_ = GroupID},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"↯ًأهلا عزيزي "..msg.TheRankCmd.."  \n↯ تم الغاء تثبيت الرساله \n")    
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯↯ عذراً لا يمكنني الغاء التثبيت .\n↯ لست مشرف او لا املك صلاحيه التثبيت \n')    
elseif data.ID == "Error" and data.code_ == 400 then
return sendMsg(msg.chat_id_,msg.id_,'↯ ًعذرا عزيزي '..msg.TheRankCmd..' .\n↯ لا توجد رساله مثبته لاقوم بازالتها \n')    
end
end,nil)
end
return false
end


if MsgText[1] == "تقييد" then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="tqeed"}) 
end 
return false
end

if MsgText[1] == "فك التقييد" or MsgText[1] == "فك تقييد" then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="fktqeed"}) 
end 
return false
end


if MsgText[1] == "رفع مميز" then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then
if redis:get(wegz..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(wegz..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(wegz..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(wegz..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"↯ أهلا عزيزي "..msg.TheRankCmd.."\n↯ الرفع معطل \n")
end
return false
end


if MsgText[1] == "تنزيل مميز" then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remwhitelist"})
end 
return false
end


if (MsgText[1] == "رفع المدير"  or MsgText[1] == "رفع مدير" ) then
if not msg.Creator then return "↯هذا الامر يخص {المطور,المنشئ} فقط  \n" end
if not MsgText[2] and msg.reply_id then
if redis:get(wegz..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setowner"})
end
end
if redis:get(wegz..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setowner"})
end
end
if redis:get(wegz..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setowner"})
end
end
if redis:get(wegz..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"↯ أهلاً عزيزي "..msg.TheRankCmd.."\n↯ الرفع معطل \n")
end
return false
end


if (MsgText[1] == "تنزيل المدير" or MsgText[1] == "تنزيل مدير" ) then
if not msg.Creator then return "↯هذا الامر يخص {المطور,المنشئ} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remowner"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remowner"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remowner"})
end 
return false
end


if (MsgText[1] == "رفع منشى اساسي" or MsgText[1] == "رفع منشئ اساسي") then
if not msg.SudoUser then return "↯هذا الامر يخص {المطور,المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setkara"}) 
return false
end 
end

if (MsgText[1] == "تنزيل منشى اساسي" or MsgText[1] == "تنزيل منشى اساسي") then
if not msg.SudoUser then return "↯هذا الامر يخص {المطور,المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remkara"}) 
return false
end 
end


if (MsgText[1] == "رفع منشى" or MsgText[1] == "رفع منشئ") then
if not msg.Kara then return "↯هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setmnsha"})
end  
return false
end


if (MsgText[1] == "تنزيل منشى" or MsgText[1] == "تنزيل منشئ" ) then
if not msg.Kara then return "↯هذا الامر يخص {المطور,المنشى الاساسي فقط} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remmnsha"})
end 
return false
end


if MsgText[1] == "رفع ادمن" then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not MsgText[2] and msg.reply_id then
if redis:get(wegz..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="promote"})
end
end
if redis:get(wegz..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="promote"})
end
end
if redis:get(wegz..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="promote"})
end
end
if redis:get(wegz..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"↯ أهلا عزيزي "..msg.TheRankCmd.."\n↯ الرفع معطل \n")
end
return false
end



if MsgText[1] == "تنزيل ادمن" then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="demote"})
end 
return false
end



if MsgText[1] == "تنزيل الكل" then
if not msg.Creator then return "↯هذا الامر يخص {المطور,المنشئ} فقط  \n" end

local Admins = redis:scard(wegz..'admins:'..msg.chat_id_)
redis:del(wegz..'admins:'..msg.chat_id_)
local NumMDER = redis:scard(wegz..'owners:'..msg.chat_id_)
redis:del(wegz..'owners:'..msg.chat_id_)
local MMEZEN = redis:scard(wegz..'whitelist:'..msg.chat_id_)
redis:del(wegz..'whitelist:'..msg.chat_id_)

return "↯ أهلاً عزيزي "..msg.TheRankCmd.." ↓\n↯ تم تنزيل ❴ "..Admins.." ❵ من الادمنيه\n↯ تم تنزيل ❴ "..NumMDER.." ❵ من المدراء\n↯ تم تنزيل ❴ "..MMEZEN.." ❵ من المميزين\n\n↯ تم تـنـزيـل الـكـل بـنـجـاح\n" 
end


--{ Commands For locks }

if MsgText[1] == "قفل" then

if MsgText[2] == "الكل"		 then return lock_All(msg) end
if MsgText[2] == "الوسائط" 	 then return lock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 	 then return tqeed_photo(msg) end
if MsgText[2] == "الفيديو بالتقييد"  then return tqeed_video(msg) end
if MsgText[2] == "المتحركه بالتقييد" then return tqeed_gif(msg) end
if MsgText[2] == "التوجيه بالتقييد"  then return tqeed_fwd(msg) end
if MsgText[2] == "الروابط بالتقييد"  then return tqeed_link(msg) end
if MsgText[2] == "الدردشه"    	     then return mute_text(msg) end
if MsgText[2] == "المتحركه" 		 then return mute_gif(msg) end
if MsgText[2] == "الصور" 			 then return mute_photo(msg) end
if MsgText[2] == "الفيديو"			 then return mute_video(msg) end
if MsgText[2] == "البصمات" 		then  return mute_audio(msg) end
if MsgText[2] == "الصوت" 		then return mute_voice(msg) end
if MsgText[2] == "الملصقات" 	then return mute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return mute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return mute_forward(msg) end
if MsgText[2] == "الموقع"	 	then return mute_location(msg) end
if MsgText[2] == "الملفات" 		then return mute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return mute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return mute_inline(msg) end
if MsgText[2] == "الكيبورد" 	then return mute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return lock_link(msg) end
if MsgText[2] == "التاك" 		then return lock_tag(msg) end
if MsgText[2] == "المعرفات" 	then return lock_username(msg) end
if MsgText[2] == "التعديل" 		then return lock_edit(msg) end
if MsgText[2] == "الكلايش" 		then return lock_spam(msg) end
if MsgText[2] == "التكرار" 		then return lock_flood(msg) end
if MsgText[2] == "البوتات" 		then return lock_bots(msg) end
if MsgText[2] == "البوتات بالطرد" 	then return lock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return lock_markdown(msg) end
if MsgText[2] == "الويب" 		then return lock_webpage(msg) end 
if MsgText[2] == "التثبيت" 		then return lock_pin(msg) end 
end

--{ Commands For Unlocks }
if MsgText[1] == "فتح" 		then 
if MsgText[2] == "الكل" then return Unlock_All(msg) end
if MsgText[2] == "الوسائط" then return Unlock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 		then return fktqeed_photo(msg) 	end
if MsgText[2] == "الفيديو بالتقييد" 	then return fktqeed_video(msg) 	end
if MsgText[2] == "المتحركه بالتقييد" 	then return fktqeed_gif(msg) 	end
if MsgText[2] == "التوجيه بالتقييد" 	then return fktqeed_fwd(msg) 	end
if MsgText[2] == "الروابط بالتقييد" 	then return fktqeed_link(msg) 	end
if MsgText[2] == "المتحركه" 	then return unmute_gif(msg) 	end
if MsgText[2] == "الدردشه" 		then return unmute_text(msg) 	end
if MsgText[2] == "الصور" 		then return unmute_photo(msg) 	end
if MsgText[2] == "الفيديو" 		then return unmute_video(msg) 	end
if MsgText[2] == "البصمات" 		then return unmute_audio(msg) 	end
if MsgText[2] == "الصوت" 		then return unmute_voice(msg) 	end
if MsgText[2] == "الملصقات" 	then return unmute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return unmute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return unmute_forward(msg) end
if MsgText[2] == "الموقع" 		then return unmute_location(msg) end
if MsgText[2] == "الملفات" 		then return unmute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return unmute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return unmute_inline(msg) 	end
if MsgText[2] == "الكيبورد" 	then return unmute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return unlock_link(msg) 	end
if MsgText[2] == "التاك" 		then return unlock_tag(msg) 	end
if MsgText[2] == "المعرفات" 	then return unlock_username(msg) end
if MsgText[2] == "التعديل" 		then return unlock_edit(msg) 	end
if MsgText[2] == "الكلايش" 		then return unlock_spam(msg) 	end
if MsgText[2] == "التكرار" 		then return unlock_flood(msg) 	end
if MsgText[2] == "البوتات" 		then return unlock_bots(msg) 	end
if MsgText[2] == "البوتات بالطرد" 	then return unlock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return unlock_markdown(msg) end
if MsgText[2] == "الويب" 		then return unlock_webpage(msg) 	end
if MsgText[2] == "التثبيت" 		then return unlock_pin(msg) end 
end
 
if MsgText[1] == "انشاء رابط" then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(wegz..'ExCmdLink'..msg.chat_id_) then
local LinkGp = ExportLink(msg.chat_id_)
if LinkGp then
LinkGp = LinkGp.result
redis:set(wegz..'linkGroup'..msg.chat_id_,LinkGp)
redis:setex(wegz..'ExCmdLink'..msg.chat_id_,120,true)
return sendMsg(msg.chat_id_,msg.id_,"↯تم انشاء رابط جديد \n↯ ["..LinkGp.."]\n↯ لعرض الرابط ارسل { الرابط } \n")
else
return sendMsg(msg.chat_id_,msg.id_,"↯ لا يمكنني انشاء رابط للمجموعه .\n↯ لانني لست مشرف في المجموعه \n")
end
else
return sendMsg(msg.chat_id_,msg.id_,"↯ لقد قمت بانشاء الرابط سابقا .\n↯ ارسل { الرابط } لرؤيه الرابط  \n")
end
return false
end 

if MsgText[1] == "ضع رابط" then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
redis:setex(wegz..'linkGroup'..msg.sender_user_id_,300,true)
return '↯ عزيزي قم برسال الرابط الجديد ...🍂'
end

if MsgText[1] == "الرابط" then
if not redis:get(wegz..'linkGroup'..msg.chat_id_) then 
return "↯ اوه لا يوجد رابط .\n↯لانشاء رابط ارسل { `انشاء رابط` }\n" 
end
local GroupName = redis:get(wegz..'group:name'..msg.chat_id_)
local GroupLink = redis:get(wegz..'linkGroup'..msg.chat_id_)
local LinkG = "["..GroupName.."]("..GroupLink..")"
return 
sendMsgg(msg.chat_id_,msg.id_,LinkG)
end
  

if MsgText[1] == "الرابط خاص" then
if not msg.Admin then return "↯ *│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
local GroupLink = redis:get(wegz..'linkGroup'..msg.chat_id_)
if not GroupLink then return "↯ اوه لا يوجد هنا رابط\n↯ *رجائا اكتب [ضع رابط]*" end
local Text = "↯ رابـط الـمـجـمـوعه ↯ \n"..Flter_Markdown(redis:get(wegz..'group:name'..msg.chat_id_)).." :\n\n["..GroupLink.."]\n"
local info, res = https.request(ApiToken..'/sendMessage?chat_id='..msg.sender_user_id_..'&text='..URL.escape(Text)..'&disable_web_page_preview=true&parse_mode=Markdown')
if res == 403 then
return "↯عذرا عزيزي \n↯ لم استطيع ارسالك الرابط لانك قمت بحظر البوت\n!"
elseif res == 400 then
return "↯عذرا عزيزي \n↯ لم استطيع ارسالك الرابط يجب عليك مراسله البوت اولا \n!"
end
if res == 200 then 
return "↯أهلاً عزيزي "..msg.TheRankCmd.."  \n↯ تم ارسال الرابط خاص لك ."
end
end


if MsgText[1] == "ضع القوانين" then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:setex(wegz..'rulse:witting'..msg.sender_user_id_,300,true)
return '↯ حسننا عزيزي  .\n↯ الان ارسل القوانين  للمجموعه .'
end

if MsgText[1] == "القوانين" then
if not redis:get(wegz..'rulse:msg'..msg.chat_id_) then 
return "↯مرحباً عزيري القوانين كلاتي .\n↯ ممنوع نشر الروابط \n↯ ممنوع التكلم او نشر صور اباحيه \n↯ ممنوع  اعاده توجيه\n↯ ممنوع التكلم بالسياسة \n↯ الرجاء احترام المدراء والادمنيه\n"
else 
return "*↯ القوانين :*\n"..redis:get(wegz..'rulse:msg'..msg.chat_id_) 
end 
end


if MsgText[1] == "ضع تكرار" then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
local NumLoop = tonumber(MsgText[2])
if NumLoop < 1 or NumLoop > 50 then 
return "↯ حدود التكرار ,  يجب ان تكون ما بين  *[2-50]*" 
end
redis:set(wegz..'flood'..msg.chat_id_,MsgText[2]) 
return "↯ تم وضع التكرار » { *"..MsgText[2].."* }"
end



if MsgText[1] == "مسح" then
if not MsgText[2] and msg.reply_id then 
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
Del_msg(msg.chat_id_, msg.reply_id) 
Del_msg(msg.chat_id_, msg.id_) 
return false
end

if MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if 500 < tonumber(MsgText[2]) then return "↯ حدود المسح ,  يجب ان تكون ما بين  *[2-100]*" end
local DelMsg = MsgText[2] + 1
GetHistory(msg.chat_id_,DelMsg,function(arg,data)
All_Msgs = {}
for k, v in pairs(data.messages_) do
if k ~= 0 then
if k == 1 then
All_Msgs[0] = v.id_
else
table.insert(All_Msgs,v.id_)
end  
end 
end 
if tonumber(DelMsg) == data.total_count_ then
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*↯ * تـم مسح ←  { *"..MsgText[2].."* } من الرسائل  \n")
end,nil))
else
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*↯ * تـم مسح ←  { *"..MsgText[2].."* } من الرسائل  \n")
end,nil))
end
end)
return false
end

if MsgText[2] == "الادمنيه" then 
if not msg.Director then return "↯ *هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end

local Admins = redis:scard(wegz..'admins:'..msg.chat_id_)
if Admins ==0 then  
return "↯ اوه هنالك خطأ .\n↯ عذراً لا يوجد ادمنيه ليتم مسحهم ." 
end
redis:del(wegz..'admins:'..msg.chat_id_)
return "↯أهلا عزيزي "..msg.TheRankCmd.."   \n↯ تم مسح {"..Admins.."} من الادمنيه في البوت \n"
end


if MsgText[2] == "قائمه المنع" then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local Mn3Word = redis:scard(wegz..':Filter_Word:'..msg.chat_id_)
if Mn3Word == 0 then 
return "↯ عذراً لا توجد كلمات ممنوعه ليتم حذفها" 
end
redis:del(wegz..':Filter_Word:'..msg.chat_id_)
return "↯أهلا عزيزي "..msg.TheRankCmd.."   \n↯ تم مسح {*"..Mn3Word.."*} كلمات من المنع"
end


if MsgText[2] == "القوانين" then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(wegz..'rulse:msg'..msg.chat_id_) then 
return "↯ عذراً لا يوجد قوانين ليتم مسحه \n!" 
end
redis:del(wegz..'rulse:msg'..msg.chat_id_)
return "↯أهلا عزيزي "..msg.TheRankCmd.."   \n↯ تم حذف القوانين بنجاح"
end


if MsgText[2] == "الترحيب"  then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(wegz..'welcome:msg'..msg.chat_id_) then 
return "↯ اوه هنالك خطأ .\n↯ عذراً لا يوجد ترحيب ليتم مسحه ." 
end
redis:del(wegz..'welcome:msg'..msg.chat_id_)
return "↯أهلا عزيزي "..msg.TheRankCmd.."   \n↯ تم حذف الترحيب بنجاح \n"
end


if MsgText[2] == "المنشى الاساسي" then
if not msg.SudoUser then return "↯هذا الامر يخص {المطور} فقط  \n" end
local NumMnsha = redis:scard(wegz..':Hussain:'..msg.chat_id_)
redis:del(wegz..':Hussain:'..msg.chat_id_)
return "↯أهلا عزيزي "..msg.TheRankCmd.."   \n↯  تم مسح {* "..NumMnsha.." *} المنشى الاساسي \n✓"
end


if MsgText[2] == "المنشئيين" then
if not msg.Kara then return "✲¦ هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
local NumMnsha = redis:scard(wegz..':MONSHA_BOT:'..msg.chat_id_)
if NumMnsha ==0 then 
return "عذرا لا يوجد منشئيين ليتم مسحهم \n!" 
end
redis:del(wegz..':MONSHA_BOT:'..msg.chat_id_)
return " أهلا عزيزي "..msg.TheRankCmd.."   \n تم مسح {* "..NumMnsha.." *} من المنشئيين\n"
end


if MsgText[2] == "المدراء" then
if not msg.Creator then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local NumMDER = redis:scard(wegz..'owners:'..msg.chat_id_)
if NumMDER ==0 then 
return "↯ عذراً لا يوجد مدراء ليتم مسحهم \n!" 
end
redis:del(wegz..'owners:'..msg.chat_id_)
return "↯أهلا عزيزي "..msg.TheRankCmd.."   \n↯ تم مسح {* "..NumMDER.." *} من المدراء  \n"
end

if MsgText[2] == 'المحظورين' then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end

local list = redis:smembers(wegz..'banned:'..msg.chat_id_)
if #list == 0 then return "*↯ لا يوجد مستخدمين محظورين  *" end
message = '↯ قائمه الاعضاء المحظورين :\n'
for k,v in pairs(list) do
StatusLeft(msg.chat_id_,v)
end 
redis:del(wegz..'banned:'..msg.chat_id_)
return "↯أهلا عزيزي "..msg.TheRankCmd.."   \n↯  تم مسح {* "..#list.." *} من المحظورين  \n"
end

if MsgText[2] == 'المكتومين' then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local MKTOMEN = redis:scard(wegz..'is_silent_users:'..msg.chat_id_)
if MKTOMEN ==0 then 
return "↯ لا يوجد مستخدمين مكتومين في المجموعه " 
end
redis:del(wegz..'is_silent_users:'..msg.chat_id_)
return "↯أهلا عزيزي "..msg.TheRankCmd.."   \n↯ تم مسح {* "..MKTOMEN.." *} من المكتومين  \n"
end

if MsgText[2] == 'المميزين' then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local MMEZEN = redis:scard(wegz..'whitelist:'..msg.chat_id_)
if MMEZEN ==0 then 
return "*↯ *لا يوجد مستخدمين مميزين في المجموعه " 
end
redis:del(wegz..'whitelist:'..msg.chat_id_)
return "↯أهلا عزيزي "..msg.TheRankCmd.."   \n↯ تم مسح {* "..MMEZEN.." *} من المميزين  \n"
end


if MsgText[2] == 'الرابط' then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(wegz..'linkGroup'..msg.chat_id_) then
return "*↯ *لا يوجد رابط مضاف اصلا " 
end
redis:del(wegz..'linkGroup'..msg.chat_id_)
return "↯أهلا عزيزي "..msg.TheRankCmd.."   \n↯ تم مسح رابط المجموعه \n"
end


end 
--End del 


if MsgText[1] == "ضع اسم" then
if not msg.Creator then return "↯هذا الامر يخص {المطور,المنشئ} فقط  \n" end
redis:setex(wegz..'name:witting'..msg.sender_user_id_,300,true)
return "↯ حسننا عزيزي  .\n↯ الان ارسل الاسم  للمجموعه .\n"
end


if MsgText[1] == "مسح الصوره" then
if not msg.Creator then return "↯هذا الامر يخص {المطور,المنشئ} فقط  \n" end
https.request(ApiToken.."/deleteChatPhoto?chat_id="..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'↯ تم مسح الصوره المجموعه .\n')
end


if MsgText[1] == "ضع صوره" then
if not msg.Creator then return "↯هذا الامر يخص {المطور,المنشئ} فقط  \n" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then 
photo_id = data.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = data.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = GetInputFile(photo_id)},
function(arg,data)
if data.ID == "Ok" then
--return sendMsg(msg.chat_id_,msg.id_,'↯ تم تغيير صوره المجموعه ⠀\n')
elseif  data.code_ == 3 then
return sendMsg(msg.chat_id_,msg.id_,'↯ ليس لدي صلاحيه تغيير الصوره \n↯ يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n')
end
end, nil)
end

end ,nil)
return false
else 
redis:setex(wegz..'photo:group'..msg.chat_id_..msg.sender_user_id_,300,true)
return '↯ حسننا عزيزي .\n↯ الان قم بارسال الصوره\n' 
end 
end


if MsgText[1] == "ضع وصف" then 
if not msg.Creator then return "↯هذا الامر يخص {المطور,المنشئ} فقط  \n" end
redis:setex(wegz..'about:witting'..msg.sender_user_id_,300,true) 
return "↯ حسننا عزيزي .\n↯ الان ارسل الوصف  للمجموعه\n" 
end


if MsgText[1] == "طرد البوتات" then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ} فقط  \n" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID="ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local Total = data.total_count_ or 0
if Total == 1 then
return sendMsg(msg.chat_id_,msg.id_,"↯ لا يـوجـد بـوتـات في الـمـجـمـوعـه .") 
else
local NumBot = 0
local NumBotAdmin = 0
for k, v in pairs(data.members_) do
if v.user_id_ ~= our_id then
kick_user(v.user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
NumBot = NumBot + 1
else
NumBotAdmin = NumBotAdmin + 1
end
local TotalBots = NumBot + NumBotAdmin  
if TotalBots  == Total - 1 then
local TextR  = "↯ عـدد الـبـوتات ↯⊱ {* "..(Total - 1).." *} ⊰↯\n\n"
if NumBot == 0 then 
TextR = TextR.."↯ لا يـمـكـن طردهم لانـهـم مشـرفـين .\n"
else
if NumBotAdmin >= 1 then
TextR = TextR.."↯ لم يتم طـرد {* "..NumBotAdmin.." *} بوت لأنهم مـشـرفين."
else
TextR = TextR.."↯ تم طـرد كــل البوتات بنجاح .\n"
end
end
return sendMsg(msg.chat_id_,msg.id_,TextR) 
end
end)
end
end
end

end,nil)

return false
end


if MsgText[1] == "كشف البوتات" then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ} فقط  \n" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID= "ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local total = data.total_count_ or 0
AllBots = '↯ قـائمه البوتات الـحالية\n\n'
local NumBot = 0
for k, v in pairs(data.members_) do
GetUserID(v.user_id_,function(arg,data)
if v.status_.ID == "ChatMemberStatusEditor" then
BotAdmin = "» *♚*"
else
BotAdmin = ""
end

NumBot = NumBot + 1
AllBots = AllBots..NumBot..'- @['..data.username_..'] '..BotAdmin..'\n'
if NumBot == total then
AllBots = AllBots..[[

↯ لديك {]]..total..[[} بوتات
↯ ملاحظة : الـ ♚ تعنـي ان البوت مشرف في المجموعـة.]]
sendMsg(msg.chat_id_,msg.id_,AllBots) 
end

end,nil)
end

end,nil)
return false
end


if MsgText[1] == 'طرد المحذوفين' then
if not msg.Creator then return "↯هذا الامر يخص {المطور,المنشئ} فقط  \n" end
sendMsg(msg.chat_id_,msg.id_,'↯ جارٍ البحث عن الحسابات المحذوفة ...')
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100','')
,offset_ = 0,limit_ = 200},function(arg,data)
if data.total_count_ and data.total_count_ <= 200 then
Total = data.total_count_ or 0
else
Total = 200
end
local NumMem = 0
local NumMemDone = 0
for k, v in pairs(data.members_) do 
GetUserID(v.user_id_,function(arg,datax)
if datax.type_.ID == "UserTypeDeleted" then 
NumMemDone = NumMemDone + 1
kick_user(v.user_id_,msg.chat_id_,function(arg,data)  
redis:srem(wegz..':MONSHA_BOT:'..msg.chat_id_,v.user_id_)
redis:srem(wegz..'whitelist:'..msg.chat_id_,v.user_id_)
redis:srem(wegz..'owners:'..msg.chat_id_,v.user_id_)
redis:srem(wegz..'admins:'..msg.chat_id_,v.user_id_)
end)
end
NumMem = NumMem + 1
if NumMem == Total then
if NumMemDone >= 1 then
sendMsg(msg.chat_id_,msg.id_,"↯ تم طـرد {* "..NumMemDone.." *} من الحسابات المحذوفه‏‏ .")
else
sendMsg(msg.chat_id_,msg.id_,'↯ لا يوجد حسابات محذوفه في المجموعه .')
end
end
end,nil)
end
end,nil)
return false
end  

if MsgText[1] == "ايدي" or MsgText[1]:lower() == "id" then
if not MsgText[2] and not msg.reply_id then

if redis:get(wegz..'lock_id'..msg.chat_id_) then 
local msgs = redis:get(wegz..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserNameID = "@"..data.username_.."" else UserNameID = "" end
local points = redis:get(wegz..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if points and points ~= "0" then
nko = points
else
nko = '0'
end
local rfih = (redis:get(wegz..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local NumGha = (redis:get(wegz..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local Namei = FlterName(data.first_name_..' '..(data.last_name_ or ""),20)
GetPhotoUser(msg.sender_user_id_,function(arg, data)
if redis:get(wegz.."getidstatus"..msg.chat_id_) == "Photo" then
	if data.photos_[0] then 
		ali = {'شهل صورة😍😌','لا قيمه للقمر امام وجهك🌚🥀','خليني احبك🙈❤️','ببكن خاص 🌚😹','نكبل 🙈♥','منور اليوم 😻','فديت الحلو🌚😹','شهل عسل ،₍🍯😻⁾ ','كلي يا حلو منين الله جابك🙈❤️','يهلا بلعافيه😍','مارتاحلك😐','تحبني؟🙈',
		}
		ssssys = ali[math.random(#ali)]
		if not redis:get("KLISH:ID") then
		sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,'⌔ ♡𝙽𝙰𝙼𝙴 ↯  '..Namei..'     \n⌔↯ 𝚄𝚂𝙴𝚁↯'..UserNameID..' .\n⌔♡ 𝙼𝚂𝙶𝙴↯'..msgs..' .\n⌔↯ 𝚂𝚃𝙰 ↯'..msg.TheRank..' .\n𖤏 𝙸𝙳 ࿖ '..msg.sender_user_id_..' \n⚘ 𝚌𝚑 𖠪 @@SOURCEwegz .',dl_cb,nil)
		else
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,"🎇│"..ssssys.."\n"..Text.."",dl_cb,nil)
		end
	else
		if not redis:get("KLISH:ID") then
		sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني عرض صورتك لانك قمت بحظر البوت او انك لاتملك صوره في بروفيلك ...!\n︙⌔↯ 𝚄𝚂𝙴𝚁↯'..UserNameID..' .\n︙⌔ ♡𝙽𝙰𝙼𝙴 ↯  '..Namei..'     \n︙⌔♡ 𝙼𝚂𝙶𝙴↯'..msgs..' .\n︙⌔↯ 𝚂𝚃𝙰 ↯'..msg.TheRank..' .\n𖤏 𝙸𝙳 ࿖ '..msg.sender_user_id_..' \n⚘ 𝚌𝚑 𖠪 @@SOURCEwegz .')
		else
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Text))
		end
	end
else
	if redis:get("KLISH:ID") then
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Text))
		else
		sendMsg(msg.chat_id_,msg.id_,'↯ الايدي بالصوره معطل \n⌔ ♡𝙽𝙰𝙼𝙴 ↯  '..Namei..'     \n⌔↯ 𝚄𝚂𝙴𝚁↯'..UserNameID..' .\n⌔♡ 𝙼𝚂𝙶𝙴↯'..msgs..' .\n⌔↯ 𝚂𝚃𝙰 ↯'..msg.TheRank..' .\n𖤏 𝙸𝙳 ࿖ '..msg.sender_user_id_..' .')
		end
end

end) 
end ,nil)
end
return false

end

if msg.reply_id and not MsgText[2] then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="iduser"})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="iduser"})
return false
end 
return false
end

if MsgText[1] == "الرتبه" and not MsgText[2] and msg.reply_id then 
return GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="rtba"})
end


if MsgText[1]== 'رسائلي' or MsgText[1] == 'رسايلي' or MsgText[1] == 'احصائياتي'  then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(wegz..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(wegz..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(wegz..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(wegz..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(wegz..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(wegz..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(wegz..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(wegz..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(wegz..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info =  " \n↯ ( الاحـصـائـيـات الـرسـائـلك )\n \n"
.."↯ الـرسـائـل ( "..msgs.." )\n"
.."↯ الـجـهـات ( "..NumGha.." )\n"
.."↯ الـصـور ( "..photo.." )\n"
.."↯ الـمـتـحـركـه ( "..animation.." )\n"
.."↯ الـمـلـصـقات ( "..sticker.." )\n"
.."↯ الـبـصـمـات ( "..voice.." )\n"
.."↯ الـصـوت ( "..audio.." )\n"
.."↯ الـفـيـديـو ( "..video.." )\n"
.."↯ الـتـعـديـل ( "..edited.." )\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'مسح' and MsgText[2] == 'رسائلي'  then
local msgs = redis:get(wegz..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if rfih == 0 then  return "↯عذرا لا يوجد رسائل لك في البوت  ." end
redis:del(wegz..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_)
return "↯تم مسح {* "..msgs.." *} من رسائلك .\n"
end

if MsgText[1]== 'جهاتي' then
return '↯  عدد جهاتك المضافة‏‏ ⇜ ❪ '..(redis:get(wegz..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ❫ \n.'
end

if MsgText[1] == 'مسح' and MsgText[2] == 'جهاتي'  then
local adduser = redis:get(wegz..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0
if adduser == 0 then  return "↯عذرا ليس لديك جهات لكي يتم مسحها" end
redis:del(wegz..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) 
return "↯تم مسح {* "..adduser.." *} من جهاتك\n✓"
end

if MsgText[1]== 'اسمي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local FlterName = FlterName(data.first_name_..' '..(data.last_name_ or ""),90)
local Get_info = " \n "..FlterName.." \n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'مسح' and MsgText[2] == 'نقاطي'  then
local points = redis:get(wegz..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0
if points == 0 then  return "↯عذرا ليس لديك نقاط لكِ يتم مسحها" end
redis:del(wegz..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
return "↯تم مسح {* "..points.." *} من نقاطك\n"
end

if MsgText[1] == 'معلوماتي' or MsgText[1] == 'موقعي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(wegz..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(wegz..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(wegz..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(wegz..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(wegz..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(wegz..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(wegz..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(wegz..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(wegz..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="↯ اهلاً بك في معلوماتك . \n"
.."——————𖣐𖣐𖣐———————\n"
.."↯𖣐 الأسم ( "..FlterName(data.first_name_..' '..(data.last_name_ or ""),25).." )\n"
.."↯𖣐 المعرف ( "..ResolveUser(data).." )\n"
.."↯𖣐 الأيدي ( `"..msg.sender_user_id_.."` )\n"
.."↯𖣐 رتبتك ( "..msg.TheRank.." )\n"
.."↯ ـ ( `"..msg.chat_id_.."` )\n"
.."————————𖣐𖣐𖣐————————\n"
.." ↯𖣐 الأحصائيات الرسائل .\n"
.."↯𖣐 الرسائل ( `"..msgs.."` )\n"
.."↯𖣐 الجهات ( `"..NumGha.."` )\n"
.."↯𖣐 الصور ( `"..photo.."` )\n"
.."↯𖣐 المتحركه ( `"..animation.."` )\n"
.."↯𖣐 الملصقات ( `"..sticker.."` )\n"
.."↯𖣐 البصمات ( `"..voice.."` )\n"
.."↯𖣐 الصوت ( `"..audio.."` )\n"
.."↯𖣐 الفيديو ( `"..video.."` )\n"
.."↯𖣐 التعديل (`"..edited.."` )\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "مسح معلوماتي" then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:del(wegz..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:del(wegz..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:del(wegz..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:del(wegz..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:del(wegz..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:del(wegz..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:del(wegz..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:del(wegz..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:del(wegz..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="↯𖣐 أهلاً عزيزي تم مسح جميع معلوماتك "
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "تفعيل" then

if MsgText[2] == "الردود" 	then return unlock_replay(msg) end
if MsgText[2] == "الاذاعه" 	then return unlock_brod(msg) end
if MsgText[2] == "الايدي" 	then return unlock_ID(msg) end
if MsgText[2] == "االترحيب" 	then return unlock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return unlock_waring(msg) end 
end




if MsgText[1] == "تعطيل" then

if MsgText[2] == "الردود" 	then return lock_replay(msg) end
if MsgText[2] == "الاذاعه" 	then return lock_brod(msg) end
if MsgText[2] == "الايدي" 	then return lock_ID(msg) end
if MsgText[2] == "االترحيب" 	then return lock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return lock_waring(msg) end
end


if MsgText[1] == "ضع الترحيب" then 
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:set(wegz..'welcom:witting'..msg.sender_user_id_,true) 
return "↯ حسننا عزيزي .\n↯ ارسل كليشه الترحيب الان\n\n↯ ملاحظه تستطيع اضافه دوال للترحيب مثلا :\n↯ أظهار قوانين المجموعه  » *{القوانين}*  \n↯  أظهار الاسم العضو » *{الاسم}*\n↯ أظهار المعرف العضو » *{المعرف}*\n↯ أظهار اسم المجموعه » *{المجموعه}*" 
end


if MsgText[1] == "الترحيب" then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if redis:get(wegz..'welcome:msg'..msg.chat_id_)  then
return Flter_Markdown(redis:get(wegz..'welcome:msg'..msg.chat_id_))
else 
return "↯أهلا عزيزي "..msg.TheRankCmd.."  \n↯ نورت المجموعه \n" 
end 
end


if MsgText[1] == "كشف"  then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="whois"})
return false
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="whois"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="whois"}) 
return false
end 
end


if MsgText[1] == "طرد" then
if not msg.Admin then return "↯𖣐هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kick"})  
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="kick"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="kick"}) 
return false
end 
end


if MsgText[1] == "حظر" then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="ban"}) 
return false
end 
end


if (MsgText[1] == "الغاء الحظر" or MsgText[1] == "الغاء حظر") and msg.Admin then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="uban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unban"})
return false
end 
end


if MsgText[1] == "كتم" then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="silent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="silent"}) 
return false
end 
end


if MsgText[1] == "الغاء الكتم" or MsgText[1] == "الغاء كتم" then
if not msg.Admin then return "↯𖣐هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unsilent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unsilent"}) 
return false
end 
end

if MsgText[1] == "المكتومين" then 
if not msg.Admin then return "↯𖣐هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return MuteUser_list(msg) 
end

if MsgText[1] == "المحظورين" then 
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return GetListBanned(msg) 
end

if MsgText[1] == "رفع الادمنيه" then
if not msg.Creator then return "↯𖣐هذا الامر يخص {المطور,المنشئ} فقط  \n" end
return set_admins(msg) 
end

end -- end of insert group 


if MsgText[1] == 'مسح' and MsgText[2] == 'المطورين'  then
if not msg.SudoBase then return"↯𖣐هذا الامر يخص {المطور الاساسي} فقط  \n" end
local mtwren = redis:scard(wegz..':SUDO_BOT:')
if mtwren == 0 then  return "↯𖣐 عذراً لا يوجد مطورين في البوت ." end
redis:del(wegz..':SUDO_BOT:') 
return "↯𖣐 تم مسح {* "..mtwren.." *} من المطورين .\n"
end

if MsgText[1] == 'مسح' and MsgText[2] == "قائمه العام"  then
if not msg.SudoBase then return"↯𖣐هذا الامر يخص {المطور الاساسي} فقط  \n" end
local addbannds = redis:scard(wegz..'gban_users')
if addbannds ==0 then 
return "*↯𖣐 قائمة الحظر فارغه .*" 
end
redis:del(wegz..'gban_users') 
return "↯𖣐 تـم مـسـح { *"..addbannds.." *} من قائمه العام\n" 
end 

if msg.SudoBase then

if MsgText[1] == "رفع مطور" then
if not msg.SudoBase then return "↯𖣐هذا الامر يخص {المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="up_sudo"}) 
return false
end 
end

if MsgText[1] == "تنزيل مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="dn_sudo"}) 
return false
end 
end

if MsgText[1] == "تنظيف المجموعات" or MsgText[1] == "تنظيف المجموعات 🗑" then
local groups = redis:smembers(wegz..'group:ids')
local GroupsIsFound = 0
for i = 1, #groups do 
GroupTitle(groups[i],function(arg,data)
if data.code_ and data.code_ == 400 then
rem_data_group(groups[i])
print(" Del Group From list ")
else
print(" Name Group : "..data.title_)
GroupsIsFound = GroupsIsFound + 1
end
print(GroupsIsFound..' : '..#groups..' : '..i)
if #groups == i then
local GroupDel = #groups - GroupsIsFound 
if GroupDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'↯𖣐 جـيـد , لا توجد مجموعات وهميه \n')
else
sendMsg(msg.chat_id_,msg.id_,'↯𖣐 عدد المجموعات ↯⊱ { *'..#groups..'*  } ⊰↯\n↯𖣐 تـم تنظيف  ↯⊱ { *'..GroupDel..'*  } ⊰↯ مجموعه \n↯𖣐 اصبح العدد الحقيقي الان ↯⊱ { *'..GroupsIsFound..'*  } ⊰↯ مجموعه')
end
end
end)
end
return false
end
if MsgText[1] == "تنظيف المشتركين" or MsgText[1] == "تنظيف المشتركين 🗑" then
local pv = redis:smembers(wegz..'users')
local NumPvDel = 0
for i = 1, #pv do
GroupTitle(pv[i],function(arg,data)
sendChatAction(pv[i],"Typing",function(arg,data)
if data.ID and data.ID == "Ok"  then
print("Sender Ok")
else
print("Failed Sender Nsot Ok")
redis:srem(wegz..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
if NumPvDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'↯ جـيـد , لا يوجد مشتركين وهمي')
else
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'↯𖣐 عدد المشتركين ↯⊱ { *'..#pv..'*  } ⊰↯\n↯𖣐 تـم تنظيف  ↯⊱ { *'..NumPvDel..'*  } ⊰↯ مشترك \n↯𖣐 اصبح العدد الحقيقي الان ↯⊱ { *'..SenderOk..'*  } ⊰↯ من المشتركين') 
end
end
end)
end)
end
return false
end
if MsgText[1] == "ضع صوره للترحيب" or MsgText[1]=="ضع صوره للترحيب" then
redis:setex(wegz..'welcom_ph:witting'..msg.sender_user_id_,300,true) 
return'↯ حسننا عزيزي .\n↯ الان قم بارسال الصوره للترحيب \n' 
end

if MsgText[1] == "تعطيل" and MsgText[2] == "البوت خدمي" then
return lock_service(msg) 
end

if MsgText[1] == "تفعيل" and MsgText[2] == "البوت خدمي" then 
return unlock_service(msg) 
end

if MsgText[1] == "صوره الترحيب" then
local Photo_Weloame = redis:get(wegz..':WELCOME_BOT')
if Photo_Weloame then
sendPhoto(msg.chat_id_,msg.id_,Photo_Weloame,[[↯ اهلا انا بوت]]..redis:get(wegz..':NameBot:')..[[ .
↯ اختصاصي حماية‌‏ المجموعات
↯ مـن السبام والتوجيه‌‏ والتكرار والخ...

↯ مـعـرف الـمـطـور  » ]]..SUDO_USER:gsub([[\_]],'_')..[[ .
]])

return false
else
return "↯ لا توجد صوره مضافه للترحيب في البوت \n↯ لاضافه صوره الترحيب ارسل `ضع صوره للترحيب`"
end
end

if MsgText[1] == "ضع كليشه المطور" then 
redis:setex(wegz..'text_sudo:witting'..msg.sender_user_id_,1200,true) 
return '↯ حسننا عزيزي .\n↯ الان قم بارسال الكليشه \n' 
end

if MsgText[1] == "ضع شرط التفعيل" and MsgText[2] and MsgText[2]:match('^%d+$') then 
redis:set(wegz..':addnumberusers',MsgText[2]) 
return '↯𖣐 تم وضـع شـرط التفعيل البوت اذا كانت المجموعه‏‏ اكثر مـن *【'..MsgText[2]..'】* عضـو  .\n' 
end

if MsgText[1] == "شرط التفعيل" then 
return'↯𖣐 شـرط التفعيل البوت اذا كانت المجموعه‏‏ اكثر مـن *【'..redis:get(wegz..':addnumberusers')..'】* عضـو .\n' 
end 
end

if MsgText[1] == 'المجموعات' or MsgText[1] == "المجموعات" then
if not msg.SudoUser then return "↯𖣐هذا الامر يخص {المطور} فقط  \n" end
return '↯ عدد المجموعات المفعلة » `'..redis:scard(wegz..'group:ids')..'`  ➼' 
end

if MsgText[1] == "المشتركين" or MsgText[1] == "المشتركين" then
if not msg.SudoUser then return "↯𖣐هذا الامر يخص {المطور} فقط  \n" end
return '↯عدد المشتركين في البوت : `'..redis:scard(wegz..'users')..'` \n'
end

if MsgText[1] == 'قائمه المجموعات' then 
if not msg.SudoBase then return "↯𖣐هذا الامر يخص {المطور} فقط  \n" end
return chat_list(msg) 
end

if MsgText[1] == 'تعطيل' and MsgText[2] and MsgText[2]:match("-100(%d+)") then
if not msg.SudoUser then return "↯𖣐هذا الامر يخص {المطور} فقط  \n" end
if redis:sismember(wegz..'group:ids',MsgText[2]) then
local name_gp = redis:get(wegz..'group:name'..MsgText[2])
sendMsg(MsgText[2],0,'↯𖣐 تم تعطيل المجموعه بأمر من المطور  \n↯𖣐 سوف اغادر ...\n✘')
rem_data_group(MsgText[2])
StatusLeft(MsgText[2],our_id)
return '↯𖣐 تم تعطيل المجموعه ومغادرتها \n↯ المجموعة » ['..name_gp..']\n↯𖣐 الايدي » ( *'..MsgText[2]..'* )\n'
else 
return '↯𖣐 لا توجد مجموعه مفعله بهذا الايدي .\n ' 
end 
end 

if MsgText[1] == 'المطور' then
return redis:get(wegz..":TEXT_SUDO") or '↯ لا توجد كليشه المطور .\n↯ يمكنك اضافه كليشه من خلال الامر\n       " `ضع كليشه المطور` " \n'
end

if MsgText[1] == "اذاعه عام بالتوجيه" or MsgText[1] == "اذاعه عام بالتوجيه" then
if not msg.SudoUser then return"↯𖣐هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(wegz..'lock_brod') then 
return "↯𖣐 الاذاعه مقفوله من قبل المطور الاساسي  ." 
end
redis:setex(wegz..'fwd:'..msg.sender_user_id_,300, true) 
return "↯𖣐 حسننا الان ارسل التوجيه للاذاعه \n" 
end

if MsgText[1] == "اذاعه عام" or MsgText[1] == "اذاعه عام" then		
if not msg.SudoUser then return"↯𖣐هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(wegz..'lock_brod') then 
return "↯𖣐 الاذاعه مقفوله من قبل المطور الاساسي  ." 
end
redis:setex(wegz..'fwd:all'..msg.sender_user_id_,300, true) 
return "↯𖣐 حسننا الان ارسل الكليشه للاذاعه عام \n" 
end

if MsgText[1] == "اذاعه خاص" or MsgText[1] == "اذاعه خاص" then		
if not msg.SudoUser then return "↯𖣐هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(wegz..'lock_brod') then 
return "↯𖣐 الاذاعه مقفوله من قبل المطور الاساسي  ." 
end
redis:setex(wegz..'fwd:pv'..msg.sender_user_id_,300, true) 
return "↯𖣐 حسننا الان ارسل الكليشه للاذاعه خاص \n"
end

if MsgText[1] == "اذاعه" or MsgText[1] == "اذاعه" then		
if not msg.SudoUser then return"↯𖣐هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(wegz..'lock_brod') then 
return "↯𖣐 الاذاعه مقفوله من قبل المطور الاساسي  ." 
end
redis:setex(wegz..'fwd:groups'..msg.sender_user_id_,300, true) 
return "↯𖣐 حسننا الان ارسل الكليشه للاذاعه للمجموعات \n" 
end

if MsgText[1] == "المطورين" or MsgText[1] == "المطورين" then
if not msg.SudoUser then return"↯هذا الامر يخص {المطور} فقط  \n↯ " end
return sudolist(msg) 
end
 
if MsgText[1] == "قائمه العام" or MsgText[1]=="قائمة العام" then 
if not msg.SudoUser then return"ٴ𐄬هذا الامر يخص {المطور} فقط  \n" end
return GetListGeneralBanned(msg) 
end

if MsgText[1] == "تعطيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل ✖️") then 
if not msg.SudoBase then return"↯هذا الامر يخص {المطور الاساسي} فقط  \n" end
return lock_twasel(msg) 
end

if MsgText[1] == "تفعيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل 🔛") then 
if not msg.SudoBase then return"↯هذا الامر يخص {المطور الاساسي} فقط  \n" end
return unlock_twasel(msg) 
end

if MsgText[1] == "حظر عام" then
if not msg.SudoBase then 
return "↯𖣐هذا الامر يخص {المطور الاساسي} فقط  \n" 
end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="banall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="bandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="banall"}) 
return false
end 
end

if MsgText[1] == "الغاء العام" or MsgText[1] == "الغاء عام" then
if not msg.SudoBase then return"↯𖣐هذا الامر يخص {المطور الاساسي} فقط  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unbanall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unbandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unbanall"}) 
return false
end 
end 

if MsgText[1] == "رتبتي" then return '↯ رتبتك ←  ( '..msg.TheRank..' )\n' end

----------------- استقبال الرسائل ---------------
if MsgText[1] == "الغاء الامر ✖️" or MsgText[1] == "الغاء" then
if not msg.Admin then return "ٴ𐄬هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:del(wegz..'welcom:witting'..msg.sender_user_id_,
wegz..'rulse:witting'..msg.sender_user_id_,
wegz..'rulse:witting'..msg.sender_user_id_,
wegz..'name:witting'..msg.sender_user_id_,
wegz..'about:witting'..msg.sender_user_id_,
wegz..'fwd:all'..msg.sender_user_id_,
wegz..'fwd:pv'..msg.sender_user_id_,
wegz..'fwd:groups'..msg.sender_user_id_,
wegz..'namebot:witting'..msg.sender_user_id_,
wegz..'addrd_all:'..msg.sender_user_id_,
wegz..'delrd:'..msg.sender_user_id_,
wegz..":Witting_KleshaID"..msg.chat_id_..msg.sender_user_id_,
wegz..':prod_pin:'..msg.chat_id_..msg.sender_user_id_,
wegz..'addrd:'..msg.sender_user_id_,
wegz..'delrdall:'..msg.sender_user_id_,
wegz..":ForceSub:"..msg.sender_user_id_,
wegz..'text_sudo:witting'..msg.sender_user_id_,
wegz..'addrd:'..msg.chat_id_..msg.sender_user_id_,
wegz..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return 'ٴ𐄬 تم إلغاء الأمر بنجاح .  \n'
end  


if (MsgText[1] ==  'تحديث السورس'  or MsgText[1] ==  'تحديث السورس 🔂' ) then
if not msg.SudoBase then return "*│*هذا الامر يخص {المطور الاساسي} فقط  \n" end
local GetVerison = https.request( 'https://raw.githubusercontent.com/ahmedyad200/wegz.github.io/master/GetVersion.txt' ) or 0
print(GetVerison.." > "..version)
if GetVerison > version then
UpdateSourceStart = true
sendMsg(msg.chat_id_,msg.id_,' *╿* يوجد تحديث جديد الان \n*╽* جاري تنزيل وتثبيت التحديث  ...' )
redis:set(wegz..":VERSION",GetVerison)
return false
else
return "╿الاصدار الحالي : *v"..version.."* \n*╽* لديـك احدث اصدار \n"
end
return false
end

if MsgText[1] == 'اصدار السورس' or MsgText[1] == 'الاصدار' then
return 'ٴ𐄬 اصدار سورس سليندر : *v'..version..'* \n'
end



if MsgText[1] == 'نسخه احتياطيه للمجموعات' then
if not msg.SudoBase then return"↯𖣐 *│*هذا الامر يخص {المطور الاساسي} فقط  \n" end
return buck_up_groups(msg)
end 

if MsgText[1] == 'رفع نسخه الاحتياطيه' then
if not msg.SudoBase then return "↯𖣐 *│*هذا الامر يخص {المطور الاساسي} فقط  \n" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessageDocument' then
local file_name = data.content_.document_.file_name_
if file_name:match('.json')then
if file_name:match('@[%a%d_]+.json') then
if file_name:lower():match('@[%a%d_]+') == Bot_User:lower() then 
io.popen("rm -f ../.telegram-cli/data/document/*")
local file_id = data.content_.document_.document_.id_ 
tdcli_function({ID = "DownloadFile",file_id_ = file_id},function(arg, data) 
if data.ID == "Ok" then
Uploaded_Groups_Ok = true
Uploaded_Groups_CH = msg.chat_id_
Uploaded_Groups_MS = msg.id_
print(Uploaded_Groups_CH)
print(Uploaded_Groups_MS)
sendMsg(msg.chat_id_,msg.id_,'↯𖣐 جارٍ رفع النسخه انتظر قليلا ... \n')
end
end,nil)
else 
sendMsg(msg.chat_id_,msg.id_,"↯𖣐 عذراً النسخه الاحتياطيه هذا ليست للبوت » ["..Bot_User.."]  \n")
end
else 
sendMsg(msg.chat_id_,msg.id_,'↯𖣐 عذراً اسم الملف غير مدعوم للنظام او لا يتوافق مع سورس سليندر يرجاء جلب الملف الاصلي الذي قمت بسحبه وبدون تعديل ع الاسم\n')
end  
else
sendMsg(msg.chat_id_,msg.id_,'↯𖣐 عذراً الملف ليس بصيغه Json !?\n')
end 
else
sendMsg(msg.chat_id_,msg.id_,'↯𖣐 عذراً هذا ليس ملف النسحه الاحتياطيه للمجموعات\n')
end 
end,nil)
else 
return "↯ ارسل ملف النسخه الاحتياطيه اولا\n↯ ثم قم بالرد على الملف وارسل \" `رفع نسخه الاحتياطيه` \" "
end 
return false
end

if (MsgText[1]=="تيست" or MsgText[1]=="test") then 
if not msg.SudoBase then return"↯هذا الامر يخص {المطور الاساسي} فقط  \n" end
return "↯ البوت شـغــال ." 
end

if (MsgText[1]== "ايدي" or MsgText[1]=="ايديي𖣐") and msg.type == "pv" then return  "\n↯ اهلاً عزيزي المطور ايديك :\n\n↯ "..msg.sender_user_id_.."\n"  end

if MsgText[1]== "قناة السورس" and msg.type == "pv" then
local inline = {{{text="-قنآهہ‏‏ آلسـورس اضـغـط هـنـآ ",url="https://t.me/SOURCEwegz"}}}
send_key(msg.sender_user_id_,'   [قناة سورس : سليندر](https://t.me/SOURCEwegz)' ,nil,inline,msg.id_)
return false
end

if (MsgText[1]== "الاحصائيات" or MsgText[1]=="الاحصائيات") then
if not msg.SudoBase then return"↯𖣐هذا الامر يخص {المطور الاساسي} فقط  \n" end
return '↯𖣐 الاحصائيات . \n\n↯𖣐عدد المجموعات المفعله : '..redis:scard(wegz..'group:ids')..'\n↯عدد المشتركين في البوت : '..redis:scard(wegz..'users')..'\n'
end
---------------[End Function data] -----------------------
if MsgText[1]=="اضف رد عام" or MsgText[1]=="اضف رد عام" then
if not msg.SudoBase then return"↯𖣐هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(wegz..'addrd_all:'..msg.chat_id_..msg.sender_user_id_,300,true)
redis:del(wegz..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
return "↯ حسننا الان ارسل كلمة الرد العام .\n"
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود' then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local names 	= redis:exists(wegz..'replay:'..msg.chat_id_)
local photo 	= redis:exists(wegz..'replay_photo:group:'..msg.chat_id_)
local voice 	= redis:exists(wegz..'replay_voice:group:'..msg.chat_id_)
local imation   = redis:exists(wegz..'replay_animation:group:'..msg.chat_id_)
local audio	 	= redis:exists(wegz..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:exists(wegz..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:exists(wegz..'replay_video:group:'..msg.chat_id_)
if names or photo or voice or imation or audio or sticker or video then
redis:del(wegz..'replay:'..msg.chat_id_,wegz..'replay_photo:group:'..msg.chat_id_,wegz..'replay_voice:group:'..msg.chat_id_,
wegz..'replay_animation:group:'..msg.chat_id_,wegz..'replay_audio:group:'..msg.chat_id_,wegz..'replay_sticker:group:'..msg.chat_id_,wegz..'replay_video:group:'..msg.chat_id_)
return "↯𖣐 تم مسح كل الردود ."
else
return '↯𖣐 لا يوجد ردود ليتم مسحها \n'
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود العامه' then
if not msg.SudoBase then return"↯𖣐 للمطورين فقط ." end
local names 	= redis:exists(wegz..'replay:all')
local photo 	= redis:exists(wegz..'replay_photo:group:')
local voice 	= redis:exists(wegz..'replay_voice:group:')
local imation 	= redis:exists(wegz..'replay_animation:group:')
local audio 	= redis:exists(wegz..'replay_audio:group:')
local sticker 	= redis:exists(wegz..'replay_sticker:group:')
local video 	= redis:exists(wegz..'replay_video:group:')
if names or photo or voice or imation or audio or sticker or video then
redis:del(wegz..'replay:all',wegz..'replay_photo:group:',wegz..'replay_voice:group:',wegz..'replay_animation:group:',wegz..'replay_audio:group:',wegz..'replay_sticker:group:',wegz..'replay_video:group:')
return "↯𖣐 تم مسح كل الردود العامه ."
else
return "↯𖣐 لا يوجد ردود عامه ليتم مسحها ."
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد عام' then
if not msg.SudoBase then return"↯𖣐هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:set(wegz..'delrdall:'..msg.sender_user_id_,true) 
return "↯𖣐 حسننا عزيزي  .\n↯ الان ارسل الرد لمسحها من  المجموعات ."
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد' then
if not msg.Director then return "↯𖣐هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
redis:set(wegz..'delrd:'..msg.sender_user_id_,true)
return "↯𖣐 حسننا عزيزي  .\n↯ الان ارسل الرد لمسحها من  للمجموعه ."
end

if MsgText[1]== 'الردود' then
if not msg.Director then return "↯𖣐 *│*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local names  	= redis:hkeys(wegz..'replay:'..msg.chat_id_)
local photo 	= redis:hkeys(wegz..'replay_photo:group:'..msg.chat_id_)
local voice  	= redis:hkeys(wegz..'replay_voice:group:'..msg.chat_id_)
local imation 	= redis:hkeys(wegz..'replay_animation:group:'..msg.chat_id_)
local audio 	= redis:hkeys(wegz..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:hkeys(wegz..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:hkeys(wegz..'replay_video:group:'..msg.chat_id_)
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '↯𖣐لا يوجد ردود مضافه حاليا \n' 
end
local ii = 1
local message = '↯𖣐ردود البوت في المجموعه  :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره ) \n' 	 ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص ) \n'  	 ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..  voice[i]..' *}_*( بصمه ) \n' 	 ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه ) \n' ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه ) \n'  ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق ) \n' 	 ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو ) \n' ii = ii + 1 end
return message..'\n➖➖➖'
end

if MsgText[1]== 'الردود العامه' or MsgText[1]=='الردود العامه' then
if not msg.SudoBase then return "↯𖣐 للمطور فقط ." end
local names 	= redis:hkeys(wegz..'replay:all')
local photo 	= redis:hkeys(wegz..'replay_photo:group:')
local voice 	= redis:hkeys(wegz..'replay_voice:group:')
local imation 	= redis:hkeys(wegz..'replay_animation:group:')
local audio 	= redis:hkeys(wegz..'replay_audio:group:')
local sticker 	= redis:hkeys(wegz..'replay_sticker:group:')
local video 	= redis:hkeys(wegz..'replay_video:group:')
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '↯𖣐لا يوجد ردود مضافه حاليا \n' 
end
local ii = 1
local message = '↯𖣐الردود العامه في البوت :   :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره ) \n' 	ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص ) \n'  	ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..	voice[i]..' *}_*( بصمه ) \n' 	ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه ) \n'ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه ) \n' ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق ) \n' 	ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو ) \n'ii = ii + 1 end
return message..'\n➖➖➖'
end


if MsgText[1]=="اضف رد" and msg.GroupActive then
if not msg.Director then return "↯𖣐هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
redis:setex(wegz..'addrd:'..msg.chat_id_..msg.sender_user_id_,300,true) 
redis:del(wegz..'replay1'..msg.chat_id_..msg.sender_user_id_)
return "↯ حسننا , الان ارسل كلمه الرد \n"
end

if MsgText[1] == "ضع اسم للبوت" or MsgText[1]== 'ضع اسم للبوت ©' then
if not msg.SudoBase then return"↯هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(wegz..'namebot:witting'..msg.sender_user_id_,300,true)
return"↯ حسننا عزيزي .\n↯ الان ارسل الاسم  للبوت ."
end



if MsgText[1] == 'server' then
if not msg.SudoUser then return "↯ للمطور فقط." end
return io.popen([[

linux_version=`lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '📟 ❪ Seystem ❫\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*↯ ❪ Memory ❫\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*↯ ❪ HardDisk ❫\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*↯ ❪ Processor ❫\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*↯ ❪ Server[_]Login ❫\n*»» '`whoami`'*'
echo '*------------------------------\n*↯ ❪ Uptime ❫  \n*»» '"$uptime"'*'
]]):read('*all')
end


if MsgText[1] == 'السيرفر' then
if not msg.SudoUser then return "↯ للمطور فقط." end
return io.popen([[

linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo ' ( نظام التشغيل )\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*↯ ( الذاكره العشوائيه )\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*↯ ( وحـده الـتـخـزيـن )\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*↯ ( الـمــعــالــج )\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*↯ ❪ الــدخــول ❫\n*»» '`whoami`'*'
echo '*------------------------------\n*↯( مـده تـشغيـل الـسـيـرفـر )  \n*»» '"$uptime"'*'
]]):read('*all')
end


if msg.type == 'channel' and msg.GroupActive then
if MsgText[1] == "الاوامر" then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n↯ " end
return [[

❈↞ ‌‌‏الأوامر ↓
——————𖣐𖣐𖣐——————
❈↯ م1 ↞ أوامر الاداره.
𑁍‌‏
❈↯ م2 ↞ أوامر إعدادات المجموعه.
𑁍‌‌‏
❈↯ م3 ↞ أوامر الحماية.
𑁍‌‌‏
❈↯ م4 ↞ أوامر الخدمه. 
𑁍‌
❈↯ م5 ↞ أوامر التسليه.
𑁍‌
❈↯ م6 ↞ أوامر التعطيل او التفعيل.
𑁍‌
❈↯ م7 ↞ أوامر الوضع للمجموعه.
𑁍‌
❈↯ م المطور ↞  أوامر المطور.
𑁍‌
❈↯ أوامر الرد ↞ لإضافة‌‏ رد معين.
𑁍‌
❈↯ الوسائط ↞ لمعرفة الإعدادات.
𑁍‌
❈↯ الإعدادات ↞ إعدادات المجموعة.
𑁍‌
❈↯ سورس ↞لعرض كليشة سورس البوت.
𑁍‌
❈↯ المطور ↞ لعرض كليشة مطور البوت.

——————𖣐𖣐𖣐——————
↯⌘للتواصل ↞ ✓ ↞{ ]]..SUDO_USER..[[ } ✓ ]]
end
if MsgText[1]== 'م1' then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n↯ " end
local text =[[     
❈↞❬أوامر الرفع والتنزيل❭
——————𖣐wegz𖣐——————
𖣐↯رفع «» تنزيل ❬منشئ ❭
𖣐↯رفع «» تنزيل ❬مدير❭ 
𖣐↯رفع «» تنزيل ❬ادمن❭ 
𖣐↯رفع «» تنزيل ❬مميز ❭ 
———————wegz—————
❈↞❬أوامر المسح❭
———————wegz—————
𖣐↯مسح الادمنـيـه «» ❬لمسح الادمنيه❭
𖣐↯مسح المميزين «» ❬لمسح المميزين❭
𖣐↯ مسح المــــدراء «» ❬لمسح المدراء❭
———————wegz—————
❈↞❬أوامر الحظر والطرد والتقييد❭
———————wegz—————
𖣐↯ حظر ❬بالرد «» بالمعرف❭ لحظر العضو.
𖣐↯ الغاء الحظر ❬بالرد «» بالمعرف❭ لإلغاء الحظر. 
𖣐↯ طرد ❬بالرد «» بالمعرف❭ لطرد العضو.
𖣐↯ كتم ❬بالرد «» بالمعرف❭ لكتم العضو. 
𖣐↯ الغاء الكتم ❬بالرد«»بالمعرف❭لإلغاء الكتم. 
𖣐↯ تقييد ❬بالرد «» بالمعرف❭ لتقييد العضو.
𖣐↯ فك التقييد ❬بالرد «» بالمعرف❭ لإلغاء تقييد العضو.
𖣐↯ منع + الكلمة «» لمنع كلمة داخل المجموعة.
𖣐↯ الغاء منع «» لالغاء منع الكلمة.
——————𖣐wegz𖣐——————
↯❁ تواصل معي للأستفسار↞ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م2' then
if not msg.Admin then return "↯𖣐هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n↯ " end
local text = [[
❈-❬أوامر الإعدادات❭
——————𖣐wegz𖣐——————
𖣐↯ الـرابـط › لعرض ❬الرابط❭ 
𑁍 
𖣐↯ انشاء رابط › لإستخراج ❬الرابط❭ 
𑁍
𖣐↯ الادمنيه › لعرض ❬الأدمنيه❭
𑁍
𖣐↯ القوانين › لعرض ❬القوانين❭ 
𑁍
𖣐↯ الوسائط › لعرض إعدادات ❬الميديا❭ 
𑁍
𖣐↯ الحمايـه › لعرض كل ❬الإعدادات❭ 
𑁍
𖣐↯ المــدراء › لعرض ❬المُديريين❭
𑁍
𖣐↯ المكتومين › لعـرض ❬المكتومين❭
𑁍
𖣐↯ المحظورين › لعرض ❬المحظورين❭
𑁍
𖣐↯ الإعدادات › لعرض إعدادات❬المجموعة❭ 
𑁍
𖣐↯ المجموعة › لعرض معلومات❬المجموعة❭
𑁍
𖣐↯ تغير امر + الامر › لتغير❬أوامر البوت❭
𑁍
𖣐↯ مسح امر + الامر › لمسح❬الأمر المضاف❭
𑁍
𖣐↯ قائمـه الاوامر › لمعرفه❬الأوامر المضافه❭
——————𖣐wegz𖣐——————
↯✰ معـرف المـطور↤︎↤︎↞ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م3' then
if not msg.Admin then return "↯هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n↯ " end
local text = [[
❈-❬أوامر حماية المجموعة❭
——————𖣐wegz𖣐——————
𖣐↯ قفل › فتح ❬الكـــل❭
𖣐↯ قفل › فتح ❬التـاك❭
𖣐↯ قفل › فتح ❬الفيـديـــو❭
𖣐↯ قفل › فتح ❬الصــــــــور❭
𖣐↯ قفل › فتح ❬الملصقات❭
𖣐↯ قفل › فتح ❬المتحركه❭
𖣐↯ قفل › فتح ❬البصمــات❭
𖣐↯ قفل › فتح ❬الدردشـــه❭
𖣐↯ قفل › فتح ❬الــروابـــط❭
𖣐↯ قفل › فتح ❬البـــوتــات❭
𖣐↯ قفل › فتح ❬التعــديــل❭
𖣐↯ قفل › فتح ❬المعرفــات❭
𖣐↯ قفل › فتح ❬الكـــلايـش❭
𖣐↯ قفل › فتح ❬التـــكـــــرار❭
𖣐↯ قفل › فتح ❬الجــهـــــات❭
𖣐↯ قفل › فتح ❬الانـــلايــن❭
𖣐↯ قفل › فتح ❬التوجيــــه❭
𖣐↯ قفل › فتح ❬الدخول بالرابط❭
𖣐↯ قفل › فتح ❬البوتات بالطرد❭
——————𖣐wegz𖣐——————
❈-❬القفل بالتقييـد❭
——————𖣐wegz𖣐——————
𖣐↯ قفل › فتح ❬الــصــــــور بالتقييـد❭
𖣐↯ قفل › فتح ❬الــروابــط بالتقييـد❭
𖣐↯ قفل › فتح ❬المتحركه بالتقييـد❭
𖣐↯ قفل › فتح ❬الفيـــديــو بالتقييد❭
𖣐↯ قفل › فتح ❬التوجيــه بالتقييــد❭ 
——————𖣐wegz𖣐——————
✰↯ معـرف المـطور ↤︎↞ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م4' then
if not msg.Director then return "↯هذا الامر يخص {المطور,المنشئ,المدير,المطور} فقط  \n↯ " end
local text = [[

❈-❬أوامر الخدمــه❭ 
——————𖣐wegz𖣐——————
✵ ايـــدي › لعرض صورتك -:- معلوماتك
𖣐↯ ايدي › لعرض ايديك .
𑁍
𖣐↯ ايدي بالرد › لعرض ايدي الشخص.
𑁍
𖣐↯ الرابط › لإستخراج رابط المجموعة.
𑁍
𖣐↯ جهاتي › لمعرفة عدد جهاتك.
𑁍
𖣐↯ الالعاب › لعرض العاب البوت.
𑁍
𖣐↯ نقاطي › لمعرفة عدد نقاطك.
𑁍
𖣐↯ بيع نقاطي + العدد › لبيع نقاطك.
𑁍
𖣐↯ معلوماتي › لعرض معلوماتك.
𑁍
𖣐↯ السورس › لعرض سورس البوت.
𑁍
𖣐↯ الرتبه بالرد › لمعرفة رتبة الشخص.
𑁍
𖣐↯ التفاعل + بالمعرف › لمعرفة تفاعل الشخص.
𑁍
𖣐↯ التفاعل بالــرد › لمعرفة تفاعل الشخص.
𑁍
𖣐↯ كشف بالمعرف › لمعرفة معلومات حسابه.
𑁍
𖣐↯ كشف بالرد › لمعرفة معلومات حسابه.
𑁍
𖣐↯ كشف البوتات › لإظهار عدد البوتات الموجوده.
𑁍
𖣐↯ طرد البوتات › لطرد كل البوتات.
𑁍
𖣐↯ طرد المحذوفين › لطرد الحسابات المحذوفه.
——————𖣐wegz𖣐——————
✰↯ معـرف المـطور ↤︎ ↞ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م5' then
if not msg.Admin then return "↯𖣐هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n↯ " end
local text =[[
❈-❬ أوامر التسلية❭
——————𖣐wegz𖣐——————
✵ مرحباً عزيزي
❁- إليك أوامر التسليه:
——————𖣐wegz𖣐——————
𖣐↯ رفع › تنزيل ❬ متوحد ❭
𖣐↯ رفع › تنزيل ❬ وتكه ❭
𖣐↯ رفع › تنزيل ❬ غبي ❭
𖣐↯ رفع › تنزيل ❬ كلب ❭
𖣐↯ رفع › تنزيل ❬ حمار ❭
𖣐↯ رفع › تنزيل ❬ زوجتي ❭
𖣐↯ رفع › تنزيل ❬ متوحده ❭
𖣐↯ رفع › ❬ بقلبي ❭ تنزيل › ❬ من قلبي❭
𖣐↯ ❬ طلاق ❭ › ❬ زواج ❭
——————𖣐wegz𖣐——————
✰↯  معـرف المـطور ↤︎ ↞ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م6' then
if not msg.Admin then return "↯𖣐هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n↯ " end
local text = [[     
❈-❬ اوامر التفعيل و التعطيل ❭
——————𖣐wegz𖣐——————
𖣐↯ تفعيل › تعطيل  ❬ الرفــع ❭
𖣐↯ تفعيل › تعطيل  ❬ الردود ❭
𖣐↯ تفعيل › تعطيل  ❬الالعـاب❭
𖣐↯ تفعيل › تعطيل  ❬ التحذير ❭
𖣐↯ تفعيل › تعطيل  ❬ الترحيب ❭
𖣐↯ تفعيل › تعطيل  ❬ الايدي ❭
𖣐↯ تفعيل › تعطيل  ❬ الايدي بالصوره ❭
——————𖣐wegz𖣐——————
✰↯  معـرف المـطور ↤︎ ↞ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م7' then
if not msg.Admin then return "↯𖣐هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n↯ " end
local text = [[
❈-❬ اوامر الوضع للمجموعه ❭
——————𖣐wegz𖣐——————
𖣐↯ ضع رابـط › لوضع ❬ رابط ❭
𑁍
𖣐↯ ضع اســـم › لوضع ❬ اســم ❭
𑁍
𖣐↯ ضع صوره › لوضع ❬ صوره ❭
𑁍
𖣐↯ ضع وصـف › لوضع ❬ وصف ❭
𑁍
𖣐↯ ضع القوانيــن › لوضع ❬ القوانين ❭
𑁍
𖣐↯ ضع الترحيب › لوضع ❬ ترحيــب ❭
𑁍
𖣐↯ ضع تكرار + العدد › لوضع ❬ تكرار ❭

——————𖣐wegz𖣐——————
✰↯  للتواصل و الإستفسار ↤︎  ↞ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== "م المطور" then
if not msg.SudoBase then return "↯ للمطور الاساسي فقط " end
local text = [[     
❈-❬اوامـر المطـور❭ 
——————𖣐wegz𖣐——————
𖣐↯ تفعيـل › ❬لتفعيل البوت ❭
𖣐↯ تعطيل › ❬لتعطيل البوت ❭
𖣐↯ رفع منشئ› ❬رفع منشئ بالبوت❭
——————𖣐wegz𖣐——————
𖣐↯ اذاعه › ❬لنشر رساله لكل 
المجموعات❭
𑁍
𖣐↯ اذاعه خاص › ❬ لنشر رساله لكل 
المشتركين خاص❭
𑁍
𖣐↯ اذاعه عام › ❬لنشر رساله لكل المجموعات والخاص❭
𑁍
𖣐↯ اذاعه عام بالتوجيه › ❬لنشر منشور قناتك بالتوجيه للكل❭
𑁍
𖣐↯ تنظيف المجموعات›  ❬لمسح المجموعات الوهميه❭
𑁍
تنظيف المشتركين › ❬لمسح المشتركين الوهميين❭
𑁍
𖣐↯ تحديث › ❬لتحديث ملفات البوت❭
𑁍
𖣐↯ تحديث السورس › ❬لتحديث السورس الى إصدار أحدث❭
——————𖣐wegz𖣐——————
✰↯  معـرف المـطور ↤︎ ↞ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1]== 'اوامر الرد' then
if not msg.Director then return "↯𖣐هذا الامر يخص {المطور,المنشئ,المدير,المطور} فقط  \n↯ " end
local text = [[     
❈-❬جميع أوامر الردود ❭
——————𖣐wegz𖣐——————
𖣐↯ الردود › لعرض الردود المثبته
𑁍
𖣐↯ اضف رد › لإضافة رد جديد.
𑁍
𖣐↯ مسح رد › الرد المُراد مسحه.
𑁍
𖣐↯ مسح الردود › لمسح كل الردود.
𑁍
𖣐↯ الردود العامه › لمعرفة الردود المثبته عام.
𑁍
𖣐↯ اضف رد عام › لإضافة رد لكل المجموعات.
𑁍
𖣐↯ مسح رد عام  › لمسح الرد العام. 
𑁍
𖣐↯ مسح الردود العامه › لمسح كل ردود العامه.
——————𖣐wegz𖣐——————
✰↯  معـرف المـطور ↤︎ ↞ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1] == "تفعيل" and MsgText[2] == "اطردني"  then
if not msg.Admin then return "↯𖣐هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n↯ " end
if not redis:get(wegz..'lave_me'..msg.chat_id_) then 
return "↯𖣐أهلا عزيزي "..msg.TheRankCmd.."\n↯ المغادره بالتاكيد تم تفعيلها\n✓" 
else 
redis:del(wegz..'lave_me'..msg.chat_id_) 
return "↯أهلا عزيزي "..msg.TheRankCmd.."\n↯ تم تفعيل المغادره \n✓" 
end 
end
if MsgText[1] == "تعطيل" and MsgText[2] == "اطردني" then
if not msg.Admin then return "↯𖣐هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n↯ " end
if redis:get(wegz..'lave_me'..msg.chat_id_) then 
return "↯𖣐أهلا عزيزي "..msg.TheRankCmd.."\n↯ المغادره من قبل البوت بالتأكيد معطله\n✓" 
else
redis:set(wegz..'lave_me'..msg.chat_id_,true)  
return "↯أهلا عزيزي "..msg.TheRankCmd.."\n↯ تم تعطيل المغادره من قبل البوت\n✓" 
end   
end

if MsgText[1] == "اطردني" or MsgText[1] == "احظرني" then
if not redis:get(wegz..'lave_me'..msg.chat_id_) then
if msg.Admin then return "لا استطيع طرد المدراء والادمنيه والمنشئين  \n" end
kick_user(msg.sender_user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
StatusLeft(msg.chat_id_,msg.sender_user_id_)
send_msg(msg.sender_user_id_,"اهلا عزيزي , لقد تم طردك من المجموعه بامر منك \nاذا كان هذا بالخطأ او اردت الرجوع للمجموعه \n\nفهذا رابط المجموعه \n"..Flter_Markdown(redis:get(wegz..'group:name'..msg.chat_id_)).." :\n\n["..redis:get(wegz..'linkGroup'..msg.chat_id_).."]\n")
sendMsg(msg.chat_id_,msg.id_," لقد تم طردك بنجاح , ارسلت لك رابط المجموعه في الخاص اذا وصلت لك تستطيع الرجوع متى شئت ")
else
sendMsg(msg.chat_id_,msg.id_," لا استطيع طردك لانك مشرف في المجموعه  ")
end
end)
return false
end
end


if MsgText[1] == "السورس" or MsgText[1]=="سورس" then
local keyboard = {}
keyboard.inline_keyboard = {
{{text = '𝐶𝐻𝐴𝑁𝑁𝐸𝐿',url="https://t.me/WEGZ_ROB0T"}},
{{text = '𝘉𝘖𝘛',url="http://t.me/WEGZ_ROBOT?startgroup=start"}},
}   
send_inline(msg.chat_id_,  "𝗦𝗢𝗨𝗥𝗖𝗘 𝗪𝗘𝗚𝗭" ,keyboard,'html')
end


if MsgText[1] == "التاريخ" then
return "\n↯  الـتـاريـخ : "..os.date("%Y/%m/%d")
end

if MsgText[1]== "سحكاتي" then
return '↯𖣐عدد سحكاتك ⇜ ❪ '..(redis:get(wegz..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ❫ \n'
end

if MsgText[1] == 'مسح' and MsgText[2] == 'سحكاتي'  then
local rfih = (redis:get(wegz..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
if rfih == 0 then  return "↯ *│* لا يوجد سحكات لك في البوت ." end
redis:del(wegz..':edited:'..msg.chat_id_..':'..msg.sender_user_id_)
return "↯𖣐 *│*تم مسح {* "..rfih.." *} من سحكاتك .\n"
end

if MsgText[1] == "تفعيل الاشتراك الاجباري" or MsgText[1] == "تفعيل الاشتراك الاجباري ☑" then
if not msg.SudoBase then return"↯𖣐هذا الامر يخص {المطور الاساسي} فقط  \n" end
if redis:get(wegz..":UserNameChaneel") then
return "↯𖣐 اهلا عزيزي المطور \n↯ الاشتراك بالتأكيد مفعل"
else
redis:setex(wegz..":ForceSub:"..msg.sender_user_id_,350,true)
return "↯𖣐 مرحبا بـك في نظام الاشتراك الاجباري\n↯ الان ارسل معرف قـنـاتـك"
end
end

if MsgText[1] == "تعطيل الاشتراك الاجباري" or MsgText[1] == "تعطيل الاشتراك الاجباري" then
if not msg.SudoBase then return"↯هذا الامر يخص {المطور الاساسي} فقط  \n" end
local SubDel = redis:del(wegz..":UserNameChaneel")
if SubDel == 1 then
return "↯𖣐 تم تعطيل الاشتراك الاجباري . \n✓"
else
return "↯𖣐 الاشتراك الاجباري بالفعل معطل . \n✓"
end
end

if MsgText[1] == "الاشتراك الاجباري" or MsgText[1] == "الاشتراك الاجباري" then
if not msg.SudoBase then return"↯𖣐هذا الامر يخص {المطور الاساسي} فقط  \n" end
local UserChaneel = redis:get(wegz..":UserNameChaneel")
if UserChaneel then
return "↯𖣐 اهلا عزيزي المطور \n↯ الاشتراك الاجباري للقناة : ["..UserChaneel.."]\n"
else
return "↯𖣐 لا يوجد قناة مفعله على الاشتراك الاجباري . \n"
end
end

if MsgText[1] == "تغيير الاشتراك الاجباري" or MsgText[1] == "تغيير الاشتراك الاجباري" then
if not msg.SudoBase then return"↯هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(wegz..":ForceSub:"..msg.sender_user_id_,350,true)
return "↯𖣐 مرحبا بـك في نظام الاشتراك الاجباري\n↯ الان ارسل معرف قـنـاتـك"
end





end

local function dwegz(msg)



local getChatId = function(id)
  local chat = {}
  local id = tostring(id)
  if id:match("^-100") then
    local channel_id = id:gsub("-100", "")
    chat = {ID = channel_id, type = "channel"}
  else
    local group_id = id:gsub("-", "")
    chat = {ID = group_id, type = "group"}
  end
  return chat
end
local getChannelFull = function(channel_id, cb)
  tdcli_function({
    ID = "GetChannelFull",
    channel_id_ = getChatId(channel_id).ID
  }, cb or dl_cb, nil)
end

local getUser = function(user_id, cb)
tdcli_function({ID = "GetUser", user_id_ = user_id}, cb, nil)
end
local getChat = function(chat_id, cb)
tdcli_function({ID = "GetChat", chat_id_ = chat_id}, cb or dl_cb, nil)
end


if redis:get(wegz..'welc'..msg.chat_id_) == 'on' then
if msg.content_.ID == 'MessageChatJoinByLink' then
function WelcomeByAddUser(BlaCk,Diamond)
local function setlinkgp(td,mrr619)
function gps(arg,data)

txt = '↯ اهلآ عزيزي '..(Diamond.first_name_ or '---')..'\n↯ المجموعه  '..(data.title_ or '---')..' \n↯ احترام الادمنيه\n↯ ممنوع طلب الرتب\n↯ ممنوع السب \n↯ ممنوع التكلم بالسياسة\n↯ الاعضاء '..mrr619.member_count_..' عضو\n↯ الادمنيه '..mrr619.administrator_count_..' \n↯ وقت الانضمام :【*'..os.date("%H:%M:%S")..'*】\n↯ تاريخ الانضمام :【*'..os.date("%Y/%m/%d")..'*】\n'
sendMsg(msg.chat_id_,msg.id_,txt)
end
getChat(msg.chat_id_,gps)
end
getChannelFull(msg.chat_id_,setlinkgp)
end
getUser(msg.sender_user_id_,WelcomeByAddUser)
end
end



local Text = msg.text
if Text then


if Text and (Text:match('(.*)')) and tonumber(msg.sender_user_id_) ~= 0 then
function dl_username(arg,data)
if data.username_ then
info = data.username_
else
info = data.first_name_
end
local hash = wegz..'user_names:'..msg.sender_user_id_
redis:set(hash,info)
end
getUser(msg.sender_user_id_,dl_username)
end

------set cmd------
Black = msg.text 
if Black == 'رفع مشرف كامل' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "↯𖣐هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط ." end

function setadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'↯𖣐 البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'↯𖣐 الأسم : ['..data.first_name_..'](tg://user?id='..diamond.sender_user_id_..')\n↯ تم رفعه مشرف بكامل الصلاحيات\n‏‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},setadmins,nil)

return false

end




if Black == 'رفع مشرف' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "↯𖣐هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط ." end

function setadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'↯𖣐 البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'↯ الأسم : ['..data.first_name_..'](tg://user?id='..diamond.sender_user_id_..')\n↯ تم رفعه مشرف \n‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},setadmins,nil)

return false

end




if Black == 'تنزيل مشرف' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "↯𖣐هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط ." end

function remadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'↯𖣐 البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'↯ الأسم : ['..data.first_name_..'](tg://user?id='..diamond.sender_user_id_..')\n↯ تم ازالته من الاشراف\n‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},remadmins,nil)

return false

end




if Black == 'تنزيل مشرف' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "↯𖣐هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط ." end

function remadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'↯𖣐 البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'↯ الأسم : ['..data.first_name_..'](tg://user?id='..diamond.sender_user_id_..')\n↯ تم إزالته من الاشراف')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},remadmins,nil)

return false

end
mmd = redis:get(wegz..'addcmd'..msg.chat_id_..msg.sender_user_id_)
if mmd then
redis:sadd(wegz..'CmDlist:'..msg.chat_id_,msg.text)
redis:hset(wegz..'CmD:'..msg.chat_id_,msg.text,mmd)
sendMsg(msg.chat_id_,msg.id_,'↯ اهلا عزيزي \n↯ تم تثبيت الامر الجديد\n✓')
redis:del(wegz..'addcmd'..msg.chat_id_..msg.sender_user_id_)
end

if Black:match('تغير امر (.*)') then
if not msg.Kara then return "↯𖣐هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
local cmd = Black:match('تغير امر (.*)') 
redis:setex(wegz..'addcmd'..msg.chat_id_..msg.sender_user_id_,120,cmd)
sendMsg(msg.chat_id_,msg.id_,'↯𖣐 اهلا بك عزيزي\n↯ الامر الي تريد تغيره الي  "'..cmd..'" \n↯ ارسله الان\n')
end

if Black and (Black:match('^delcmd (.*)') or Black:match('^مسح امر (.*)')) then
if not msg.Kara then return "↯𖣐هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
local cmd = Black:match('^delcmd (.*)') or Black:match('^مسح امر (.*)')
redis:hdel(wegz..'CmD:'..msg.chat_id_,cmd)
redis:srem(wegz..'CmDlist:'..msg.chat_id_,cmd)
sendMsg(msg.chat_id_,msg.id_,"↯𖣐 اهلا عزيزي\nالامر >"..cmd.."\n↯ تم مسحه من قائمه الاوامر\n")
end
if Black == 'مسح قائمه الاوامر' or Black == 'مسح قائمه الاوامر' then
if not msg.Kara then return "↯𖣐هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
redis:del(wegz..'CmD:'..msg.chat_id_)
redis:del(wegz..'CmDlist:'..msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,"↯𖣐 اهلا عزيزي تم مسح قائمه الاوامر")
end
if Black == "قائمه الاوامر" then
if not msg.Kara then return "↯𖣐هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
local CmDlist = redis:smembers(wegz..'CmDlist:'..msg.chat_id_)
local t = '↯ قائمه الاوامر : \n'
for k,v in pairs(CmDlist) do
mmdi = redis:hget(wegz..'CmD:'..msg.chat_id_,v)
t = t..k..") "..v.." > "..mmdi.."\n" 
end
if #CmDlist == 0 then
t = '↯ عزيزي لم تقم ب اضافه امر .'
end
sendMsg(msg.chat_id_,msg.id_,t)
end




if Black == 'welcome on' or Black == 'تفعيل الترحيب' then
if redis:get(wegz..'welc'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل الترحيب سابقا')
else
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل الترحيب')
redis:set(wegz..'welc'..msg.chat_id_,'on')
end
end
if Text == 'welcome off' or Text == 'تعطيل الترحيب' then
if redis:get(wegz..'welc'..msg.chat_id_) == 'off' then
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل الترحيب سابقا')
redis:set(wegz..'welc'..msg.chat_id_,'off')
redis:del(wegz..'welc'..msg.chat_id_,'on')
else
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل الترحيب')
end
end

if Text == "join on" and msg.SudoUser then
redis:set(wegz..'joinchnl',true)
sendMsg(msg.chat_id_,msg.id_,'on')
end
if Text and redis:get(wegz..'setchs') and msg.SudoUser then
redis:set(wegz..'setch',Text)
sendMsg(msg.chat_id_,msg.id_,'تم تعين القناه علي \n'..Text)
redis:del(wegz..'setchs')
end
if Text and (Text:match("^setch$")) and msg.SudoUser then
sendMsg(msg.chat_id_,msg.id_,'ارسل معرفك بدون @')
redis:setex(wegz..'setchs',120,true)
end


if Text == 'time' or Text == 'الوقت' and is_JoinChannel(msg) then
local colors = {'blue','green','yellow','magenta','Orange','DarkOrange','red'}
local fonts = {'mathbf','mathit','mathfrak','mathrm'}
local url1 = 'http://latex.codecogs.com/png.download?'..'\\dpi{600}%20\\huge%20\\'..fonts[math.random(#fonts)]..'{{\\color{'..colors[math.random(#colors)]..'}'..os.date("%H:%M")..'}}'	
file = download_to_file(url1,'time.webp')

print('TIMESSSS')
sendDocument(msg.chat_id_,msg.id_,file,'',dl_cb,nil)
end
if Text:match('^tosticker$') or Text:match('^تحويل ملصق$') and tonumber(msg.reply_to_message_id_) > 0 then
whoami()
BD = '/home/root/.telegram-cli/data/'
function tosticker(arg,data)
if data.content_.ID == 'MessagePhoto' then
if BD..'photo/'..data.content_.photo_.id_..'_(1).jpg' == '' then
pathf = BD..'photo/'..data.content_.photo_.id_..'.jpg'
else
pathf = BD..'photo/'..data.content_.photo_.id_..'_(1).jpg'
end
sendSticker(msg.chat_id_,msg.id_,pathf,'')
else
sendMsg(msg.chat_id_,msg.id_,'↯ عزيزي المستخدم\n↯ الامر فقط للصوره\n')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tosticker, nil)
end

if Text == 'tophoto' or Text == 'صوره' and tonumber(msg.reply_to_message_id_) > 0 then
function tophoto(kara,wegz)   
if wegz.content_.ID == "MessageSticker" then        
local bd = wegz.content_.sticker_.sticker_.path_          
sendPhoto(msg.chat_id_,msg.id_,bd,'')
else
sendMsg(msg.chat_id_,msg.id_,'↯ عزيزي المستخدم\n↯ الامر فقط للملصق\n✓')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tophoto, nil)
end
end

if msg.type == "pv" then 

if not msg.SudoUser then
local msg_pv = tonumber(redis:get(wegz..'user:'..msg.sender_user_id_..':msgs') or 0)
if msg_pv > 5 then
redis:setex(wegz..':mute_pv:'..msg.sender_user_id_,18000,true)   
return sendMsg(msg.chat_id_,0,'*↯ * تم حظرك من البوت بسبب التكرار \n') 
end
redis:setex(wegz..'user:'..msg.sender_user_id_..':msgs',2,msg_pv+1)
end

if msg.text=="/start" then 

if msg.SudoBase then
local text = '- شكراً لك لإستخدام سورس سليندر\n- أنت المطور الاساسي هنا\n—————————\n\n- يمكنك الأن التحكم بأوامر البوت عن طريق لوحة التحكم بالبوت\nفقط انقر على الأمر الذي اريده‏\n—————————\n\n-مطور السورس @ahmedyad200'
local keyboard = {
{"الاحصائيات"},
{"تعطيل الترحيب","ضع اسم للبوت","ضع صوره للترحيب"},
 {"تعطيل التواصل","تفعيل التواصل"},
{"المطورين","تعطيل البوت خدمي","تفعيل البوت خدمي"},
 {"مسح رد عام","اضف رد عام","الردود العامه"},
 {"اذاعه","اذاعه خاص"},
{"اذاعه عام","اذاعه عام بالتوجيه"},
 {"قائمه العام","ايدي"},
{"تعطيل الاشتراك الاجباري","تفعيل الاشتراك الاجباري"},
{"تغيير الاشتراك الاجباري","الاشتراك الاجباري"},
{"قائمه المجموعات","تنظيف المشتركين","تنظيف المجموعات"},
{"نسخه احتياطيه للمجموعات","رفع نسخه الاحتياطيه"},
{"الاصدار","تحديث السورس","تحديث"},
{"السورس","السيرفر"},
 {"الغاء"}}
return send_key(msg.sender_user_id_,text,keyboard,nil,msg.id_)
else
redis:sadd(wegz..'users',msg.sender_user_id_)
if redis:get(wegz..'lock_service') then 
text = [[↯ أهلاً انا بوت   []]..redis:get(wegz..':NameBot:')..[[] 🗽
𖣐↯ أختصاصي حماية المجموعات ..
𖣐↯ مـن السبام والتوجيه والتكرار والخ..
𖣐↯ لتفعيل البوت اتبع الشـروط ..
𖣐1- اضف البوت الى المجموعه
𖣐2- ارفع البوت مشرف في المجموعه
𖣐3- ارسل تفعيل وسيتم تفعيل البوت ورفع مشرفي القررب تلقائياً .

ــــــــــــــــــــــــــــــــ𖣐wegz𖣐ـــــــــــــــــــــــــ
 ↯ مـعـرف الـمـطـــور : ]]..SUDO_USER..[[
]]
else
text = [[↯ أهلاً انا بوت    []]..redis:get(wegz..':NameBot:')..[[] 🗽
𖣐↯ أختصاصي حماية المجموعات ..
𖣐↯ مـن السبام والتوجيه والتكرار والخ..
𖣐↯ لتفعيل البوت اتبع الشـروط ..
𖣐1- اضف البوت الى المجموعه
𖣐2- ارفع البوت مشرف في المجموعه
𖣐③- ارسل تفعيل وسيتم تفعيل البوت ورفع مشرفي القررب تلقائياً .

ـــــــــــــــــــــــــــــــــwegzــــــــــــــــــــــــ
 ↯ مـعـرف الـمـطـــور : ]]..SUDO_USER..[[
]]
end
xsudouser = SUDO_USER:gsub('@','')
xsudouser = xsudouser:gsub([[\_]],'_')
local inline = {{{text="مـطـور الـبـوت ✓",url="t.me/"..xsudouser}}}
send_key(msg.sender_user_id_,text,nil,inline,msg.id_)
return false
end
end
 
if msg.SudoBase then
if msg.reply_id and msg.text ~= "رفع نسخه الاحتياطيه" then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,datainfo)
if datainfo.forward_info_ then
local FwdUser = datainfo.forward_info_.sender_user_id_
local FwdDate = datainfo.forward_info_.date_
GetUserID(FwdUser,function(arg,data)
local MSG_ID = (redis:get(wegz.."USER_MSG_TWASEL"..FwdDate) or 1)
if msg.text then
sendMsg(FwdUser,MSG_ID,Flter_Markdown(msg.text))
elseif msg.sticker then
sendSticker(FwdUser,MSG_ID,sticker_id,msg.content_.caption_ or '')
elseif msg.photo then
sendPhoto(FwdUser,MSG_ID,photo_id,msg.content_.caption_ or '')
elseif msg.voice then
sendVoice(FwdUser,MSG_ID,voice_id,msg.content_.caption_ or '')
elseif msg.animation then
sendAnimation(FwdUser,MSG_ID,animation_id,msg.content_.caption_ or '')
elseif msg.video then
sendVideo(FwdUser,MSG_ID,video_id,msg.content_.caption_ or '')
elseif msg.audio then
sendAudio(FwdUser,MSG_ID,audio_id,msg.content_.caption_ or '')
end 

if data.username_ then 
USERNAME = '@'..data.username_
else 
USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or ""),20) 
end
USERCAR = utf8.len(USERNAME)

SendMention(msg.sender_user_id_,data.id_,msg.id_,"↯ تم ارسال الرسالة .\n↯ إلى : "..USERNAME.." .",39,USERCAR) 
return false 
end,nil)
end  
end,nil)
end 
else
if not redis:get(wegz..'lock_twasel') then
if msg.forward_info_ or msg.sticker or msg.content_.ID == "MessageUnsupported" then
sendMsg(msg.chat_id_,msg.id_,"↯ عذراً لا يمكنك ارسال { توجيه‌‏ , ملصق , فديو كام} .")
return false
end
redis:setex(wegz.."USER_MSG_TWASEL"..msg.date_,43200,msg.id_)
sendMsg(msg.chat_id_,msg.id_,"↯𖣐 تم آرسـآل رسالتك إلى المطور\n↯ سـآرد عليك في اقرب وقت ممكن \n↯ معرف المطور "..SUDO_USER)
tdcli_function({ID='GetChat',chat_id_ = SUDO_ID},function(arg,data)
fwdMsg(SUDO_ID,msg.chat_id_,msg.id_)
end,nil)
return false
end
end
end

--====================== Reply Only Group ====================================
if redis:get(wegz..'addrd:'..msg.chat_id_..msg.sender_user_id_) and redis:get(wegz..'replay1'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(wegz..'replay1'..msg.chat_id_..msg.sender_user_id_)
if msg.text then 
redis:hset(wegz..'replay:'..msg.chat_id_,klma,Flter_Markdown(msg.text))
redis:del(wegz..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n↯ تم اضافت الرد . \n-')
elseif msg.photo then 
redis:hset(wegz..'replay_photo:group:'..msg.chat_id_,klma,photo_id)
redis:del(wegz..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'↯ تم اضافه صوره للرد بنجاح\n↯ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوره الاتيه ')
elseif msg.voice then
redis:hset(wegz..'replay_voice:group:'..msg.chat_id_,klma,voice_id)
redis:del(wegz..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'↯ تم اضافه بصمه صوت للرد بنجاح\n↯ يمكنك ارسال ❴ ['..klma..'] ❵ لسماع البصمه الاتيه ')
elseif msg.animation then
redis:hset(wegz..'replay_animation:group:'..msg.chat_id_,klma,animation_id)
redis:del(wegz..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'↯ تم اضافه متحركه للرد بنجاح\n↯ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوره الاتيه ')
elseif msg.video then
redis:hset(wegz..'replay_video:group:'..msg.chat_id_,klma,video_id)
redis:del(wegz..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'↯ تم اضافه فيديو للرد بنجاح\n↯ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الفيديو الاتي ')
elseif msg.audio then
redis:hset(wegz..'replay_audio:group:'..msg.chat_id_,klma,audio_id)
redis:del(wegz..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'↯ تم اضافه للصوت للرد بنجاح\n↯ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوت الاتي ')
elseif msg.sticker then
redis:hset(wegz..'replay_sticker:group:'..msg.chat_id_,klma,sticker_id)
redis:del(wegz..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'↯ تم اضافه ملصق للرد بنجاح\n↯ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الملصق الاتي ')
end  

end

--====================== Reply All Groups =====================================
if redis:get(wegz..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) and redis:get(wegz..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(wegz..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
if msg.text then
redis:hset(wegz..'replay:all',klma,Flter_Markdown(msg.text))
redis:del(wegz..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  ↯ تم اضافت الرد لكل المجموعات . ')
elseif msg.photo then 
redis:hset(wegz..'replay_photo:group:',klma,photo_id)
redis:del(wegz..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'↯ تم اضافه صوره للرد العام\n↯ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوره الاتيه ')
elseif msg.voice then
redis:hset(wegz..'replay_voice:group:',klma,voice_id)
redis:del(wegz..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'↯ تم اضافه بصمه صوت للرد العام\n↯ يمكنك ارسال ❴ ['..klma..'] ❵ لسماع البصمه الاتيه ')
elseif msg.animation then
redis:hset(wegz..'replay_animation:group:',klma,animation_id)
redis:del(wegz..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'↯ تم اضافه متحركه للرد العام\n↯ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوره الاتيه ')
elseif msg.video then
redis:hset(wegz..'replay_video:group:',klma,video_id)
redis:del(wegz..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'↯ تم اضافه فيديو للرد العام\n↯ يمكنك ارسال ❴ ['..klma..'] ❵لأظهار الفيديو الاتي ')
elseif msg.audio then
redis:hset(wegz..'replay_audio:group:',klma,audio_id)
redis:del(wegz..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'↯ تم اضافه للصوت للرد العام\n↯ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوت الاتي ')
elseif msg.sticker then
redis:hset(wegz..'replay_sticker:group:',klma,sticker_id)
redis:del(wegz..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'↯ تم اضافه ملصق للرد العام\n↯ يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الملصق الاتي ')
end  

end

if msg.text then
--====================== Requst UserName Of Channel For ForceSub ==============
if redis:get(wegz..":ForceSub:"..msg.sender_user_id_) then
if msg.text:match("^@[%a%d_]+$") then
redis:del(wegz..":ForceSub:"..msg.sender_user_id_)
local url , res = https.request(ApiToken..'/getchatmember?chat_id='..msg.text..'&user_id='..msg.sender_user_id_)
if res == 400 then
local Req = JSON.decode(url)
if Req.description == "Bad Request: chat not found" then 
sendMsg(msg.chat_id_,msg.id_,"↯ عذراً , هناك خطأ لديك \n↯ المعرف الذي ارسلته ليس معرف قناة.")
return false
elseif Req.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
sendMsg(msg.chat_id_,msg.id_,"↯ عذراً , لقد نسيت شيئا \n↯ يجب رفع البوت مشرف في قناتك لتتمكن من تفعيل الاشتراك الاجباري .")
return false
end
else
redis:set(wegz..":UserNameChaneel",msg.text)
sendMsg(msg.chat_id_,msg.id_,"↯ جـيـد , الان لقد تم تفعيل الاشتراك الاجباري\n↯ على قناتك ⇜ ["..msg.text.."]")
return false
end
else
sendMsg(msg.chat_id_,msg.id_,"↯ عذرا , عزيزي المطور \n↯ هذا ليس معرف قناة , حاول مجددا .")
return false
end
end

if redis:get(wegz..'namebot:witting'..msg.sender_user_id_) then --- استقبال اسم البوت 
redis:del(wegz..'namebot:witting'..msg.sender_user_id_)
redis:set(wegz..':NameBot:',msg.text)
Start_Bot() 
sendMsg(msg.chat_id_,msg.id_,"↯ تم تغير اسم البوت  .\n↯ الان اسمه "..Flter_Markdown(msg.text).." \n")
return false
end

if redis:get(wegz..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد لكل المجموعات
if not redis:get(wegz..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال كلمه الرد لكل المجموعات
redis:hdel(wegz..'replay_photo:group:',msg.text)
redis:hdel(wegz..'replay_voice:group:',msg.text)
redis:hdel(wegz..'replay_animation:group:',msg.text)
redis:hdel(wegz..'replay_audio:group:',msg.text)
redis:hdel(wegz..'replay_sticker:group:',msg.text)
redis:hdel(wegz..'replay_video:group:',msg.text)
redis:setex(wegz..'allreplay:'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"↯ جيد , يمكنك الان ارسال جوا ب الردالعام \n↯ [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]]\n")
end
end

if redis:get(wegz..'delrdall:'..msg.sender_user_id_) then
redis:del(wegz..'delrdall:'..msg.sender_user_id_)
local names = redis:hget(wegz..'replay:all',msg.text)
local photo =redis:hget(wegz..'replay_photo:group:',msg.text)
local voice = redis:hget(wegz..'replay_voice:group:',msg.text)
local animation = redis:hget(wegz..'replay_animation:group:',msg.text)
local audio = redis:hget(wegz..'replay_audio:group:',msg.text)
local sticker = redis:hget(wegz..'replay_sticker:group:',msg.text)
local video = redis:hget(wegz..'replay_video:group:',msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'↯هذا الرد ليس مضاف في قائمه الردود .')
else
redis:hdel(wegz..'replay:all',msg.text)
redis:hdel(wegz..'replay_photo:group:',msg.text)
redis:hdel(wegz..'replay_voice:group:',msg.text)
redis:hdel(wegz..'replay_audio:group:',msg.text)
redis:hdel(wegz..'replay_animation:group:',msg.text)
redis:hdel(wegz..'replay_sticker:group:',msg.text)
redis:hdel(wegz..'replay_video:group:',msg.text)
return sendMsg(msg.chat_id_,msg.id_,'('..Flter_Markdown(msg.text)..')\n↯ تم مسح الرد . ')
end 
end 


if redis:get(wegz..'text_sudo:witting'..msg.sender_user_id_) then -- استقبال كليشه المطور
redis:del(wegz..'text_sudo:witting'..msg.sender_user_id_) 
redis:set(wegz..':TEXT_SUDO',Flter_Markdown(msg.text))
return sendMsg(msg.chat_id_,msg.id_, "↯ تم وضع الكليشه بنجاح كلاتي .\n\n*{*  "..Flter_Markdown(msg.text).."  *}*\n")
end
if redis:get(wegz..'welcom:witting'..msg.sender_user_id_) then -- استقبال كليشه الترحيب
redis:del(wegz..'welcom:witting'..msg.sender_user_id_) 
redis:set(wegz..'welcome:msg'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"↯ تم وضع الترحيب بنجاح كلاتي .\n" )
end
if redis:get(wegz..'rulse:witting'..msg.sender_user_id_) then --- استقبال القوانين
redis:del(wegz..'rulse:witting'..msg.sender_user_id_) 
redis:set(wegz..'rulse:msg'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'↯ مرحبآ عزيزي\n↯ تم حفظ القوانين بنجاح .\n↯ ارسل [[ القوانين ]] لعرضها \n')
end
if redis:get(wegz..'name:witting'..msg.sender_user_id_) then --- استقبال الاسم
redis:del(wegz..'name:witting'..msg.sender_user_id_) 
tdcli_function({ID= "ChangeChatTitle",chat_id_=msg.chat_id_,title_=msg.text},dl_cb,nil)
end
if redis:get(wegz..'linkGroup'..msg.sender_user_id_,link) then --- استقبال الرابط
redis:del(wegz..'linkGroup'..msg.sender_user_id_,link) 
redis:set(wegz..'linkGroup'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'↯ تم وضع الرابط الجديد بنجاح .. 🍂')
end
if redis:get(wegz..'about:witting'..msg.sender_user_id_) then --- استقبال الوصف
redis:del(wegz..'about:witting'..msg.sender_user_id_) 
tdcli_function({ID="ChangeChannelAbout",channel_id_=msg.chat_id_:gsub('-100',''),about_ = msg.text},function(arg,data) 
if data.ID == "Ok" then 
return sendMsg(msg.chat_id_,msg.id_,"↯ تم وضع الوصف بنجاح\n")
end 
end,nil)
end


if redis:get(wegz..'fwd:all'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه عام
redis:del(wegz..'fwd:all'..msg.sender_user_id_)
local pv = redis:smembers(wegz..'users')  
local groups = redis:smembers(wegz..'group:ids')
local allgp =  #pv + #groups
if allgp >= 300 then
sendMsg(msg.chat_id_,msg.id_,'↯ اهلا عزيزي المطور \n↯ جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
for i = 1, #pv do 
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem user From list")
redis:srem(wegz..'users',pv[i])
end
end)
end
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
rem_data_group(groups[i])
end
end)
end
return sendMsg(msg.chat_id_,msg.id_,'↯تم اذاعه الكليشه بنجاح .\n↯للمجموعات » ( *'..#groups..'* )\n↯ للمشتركين » ( '..#pv..' )\n')
end

if redis:get(wegz..'fwd:pv'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(wegz..'fwd:pv'..msg.sender_user_id_)
local pv = redis:smembers(wegz..'users')
if #pv >= 300 then
sendMsg(msg.chat_id_,msg.id_,'↯ اهلا عزيزي المطور \n↯ جاري نشر الرساله للمشتركين ...')			
end
local NumPvDel = 0
for i = 1, #pv do
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
redis:srem(wegz..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'↯عدد المشتركين : ❴ '..#pv..' ❵\n↯تم الاذاعه الى ❴ '..SenderOk..'  ❵ مشترك \n') 
end
end)
end
end

if redis:get(wegz..'fwd:groups'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(wegz..'fwd:groups'..msg.sender_user_id_)
local groups = redis:smembers(wegz..'group:ids')
if #groups >= 300 then
sendMsg(msg.chat_id_,msg.id_,'↯ اهلا عزيزي المطور \n↯ جاري نشر الرساله للمجموعات ...')			
end
local NumGroupsDel = 0
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok") 
else
print("Rem Group From list")
rem_data_group(groups[i])
NumGroupsDel = NumGroupsDel + 1
end
if #groups == i then
local AllGroupSend = #groups - NumGroupsDel
if NumGroupsDel ~= 0 then
MsgTDel = '↯تم حذف ❴ *'..NumGroupsDel..'* ❵ من قائمه الاذاعه لانهم قامو بطرد البوت من المجموعه'
else
MsgTDel = ''
end
sendMsg(msg.chat_id_,msg.id_,'↯عدد المجموعات ❴ *'..#groups..'* ❵\n↯تـم الاذاعه الى ❴ *'..AllGroupSend..'* ❵\n'..MsgTDel..'')
end
end)
end
end 
end 

if msg.adduser and msg.adduser == our_id and redis:get(wegz..':WELCOME_BOT') then
sendPhoto(msg.chat_id_,msg.id_,redis:get(wegz..':WELCOME_BOT'),[[↯أهلاً انا بوت ]]..redis:get(wegz..':NameBot:')..[[
↯ أختصاصي حماية‌‏ المجموعات
↯ مـن السبام والتوجيه‌‏ والتكرار والخ...

↯ مـعـرف الـمـطـور  : ]]..SUDO_USER:gsub([[\_]],'_')..[[
]])
return false
end 

if msg.forward_info and redis:get(wegz..'fwd:'..msg.sender_user_id_) then
redis:del(wegz..'fwd:'..msg.sender_user_id_)
local pv = redis:smembers(wegz..'users')
local groups = redis:smembers(wegz..'group:ids')
local allgp =  #pv + #groups
if allgp == 500 then
sendMsg(msg.chat_id_,msg.id_,'↯ اهلا عزيزي المطور \n↯ جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
local number = 0
for i = 1, #pv do 
fwdMsg(pv[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
for i = 1, #groups do 
fwdMsg(groups[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
return sendMsg(msg.chat_id_,msg.id_,'↯تم اذاعه التوجيه بنجاح .\n↯للمجموعات » ❴ *'..#groups..'* ❵\n↯للخاص » ❴ '..#pv..' ❵\n')			
end

 

if msg.text and msg.type == "channel" then
if msg.text:match("^"..Bot_Name.." غادر$") and (msg.SudoBase or msg.SudoBase or msg.Director) then
sendMsg(msg.chat_id_,msg.id_,'!!!')
rem_data_group(msg.chat_id_)
StatusLeft(msg.chat_id_,our_id)
return false
end
end

if msg.content_.ID == "MessagePhoto" and redis:get(wegz..'welcom_ph:witting'..msg.sender_user_id_) then
redis:del(wegz..'welcom_ph:witting'..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:set(wegz..':WELCOME_BOT',photo_id)
return sendMsg(msg.chat_id_,msg.id_,'↯ تم تغيير صوره‏‏ الترحيب للبوت .\n')
end 

if msg.content_.ID == "MessagePhoto" and msg.type == "channel" and msg.GroupActive then
if redis:get(wegz..'photo:group'..msg.chat_id_..msg.sender_user_id_) then
redis:del(wegz..'photo:group'..msg.chat_id_..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_=msg.chat_id_,photo_=GetInputFile(photo_id)},function(arg,data)
if data.code_ == 3 then
sendMsg(arg.chat_id_,arg.id_,'↯ ليس لدي صلاحيه تغيير الصوره \n↯ يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n')
end
end,{chat_id_=msg.chat_id_,id_=msg.id_})
return false
end
end

if not msg.GroupActive then return false end
if msg.text then

if redis:get(wegz..'addrd:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد للمجموعه فقط

if not redis:get(wegz..'replay1'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
redis:hdel(wegz..'replay:'..msg.chat_id_,msg.text)
redis:hdel(wegz..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(wegz..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(wegz..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(wegz..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(wegz..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(wegz..'replay_video:group:'..msg.chat_id_,msg.text)
redis:setex(wegz..'replay1'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"↯ جيد , يمكنك الان ارسال جواب الرد \n↯ [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]]\n")
end
end

if redis:get(wegz..'delrd:'..msg.sender_user_id_) then
redis:del(wegz..'delrd:'..msg.sender_user_id_)
local names 	= redis:hget(wegz..'replay:'..msg.chat_id_,msg.text)
local photo 	= redis:hget(wegz..'replay_photo:group:'..msg.chat_id_,msg.text)
local voice 	= redis:hget(wegz..'replay_voice:group:'..msg.chat_id_,msg.text)
local animation = redis:hget(wegz..'replay_animation:group:'..msg.chat_id_,msg.text)
local audio 	= redis:hget(wegz..'replay_audio:group:'..msg.chat_id_,msg.text)
local sticker 	= redis:hget(wegz..'replay_sticker:group:'..msg.chat_id_,msg.text)
local video 	= redis:hget(wegz..'replay_video:group:'..msg.chat_id_,msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'↯هذا الرد ليس مضاف في قائمه الردود .')
else
redis:hdel(wegz..'replay:'..msg.chat_id_,msg.text)
redis:hdel(wegz..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(wegz..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(wegz..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(wegz..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(wegz..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(wegz..'replay_video:group:'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..msg.text..'])\n↯ تم مسح الرد . ')
end 
end

end

if msg.pinned then
print(" -- pinned -- ")
local msg_pin_id = redis:get(wegz..":MsgIDPin:"..msg.chat_id_)
if not msg.Director and redis:get(wegz..'lock_pin'..msg.chat_id_) then
if msg_pin_id then
print(" -- pinChannelMessage -- ")
tdcli_function({ID ="PinChannelMessage",
channel_id_ = msg.chat_id_:gsub('-100',''),
message_id_ = msg_pin_id,
disable_notification_ = 0},
function(arg,data)
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"↯ ًعذرا التثبيت مقفل من قبل الاداره تم ارجاع التثبيت القديم\n")
end
end,nil)
else
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"↯ ًعذرا التثبيت مقفل من قبل الاداره تم الغاء التثبيت\n")      
end
end,nil)
end
return false
end
redis:set(wegz..":MsgIDPin:"..msg.chat_id_,msg.id_)
end

if msg.content_.ID == "MessageChatChangePhoto" then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end
return sendMsg(msg.chat_id_,msg.id_," قام ["..UserName.."] بتغير صوره المجموعه .\n")
end)
end

if msg.content_.ID == "MessageChatChangeTitle" then
GetUserID(msg.sender_user_id_,function(arg,data)
redis:set(wegz..'group:name'..msg.chat_id_,msg.content_.title_)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end

return sendMsg(msg.chat_id_,msg.id_,"↯ قام  ["..UserName.."]\n↯ بتغير اسم المجموعه .\n↯ الى "..Flter_Markdown(msg.content_.title_).." \n") 
end)
end
if msg.adduser or msg.joinuser then
if redis:get(wegz..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
else
if redis:get(wegz..'welcome:get'..msg.chat_id_) then 
if not msg.adduserType then
GetUserID(msg.sender_user_id_,function(arg,data)  
welcome = (redis:get(wegz..'welcome:msg'..msg.chat_id_) or "↯ اهلاً عزيزي {الاسم}\n↯ معرفك » {المعرف}\n{القوانين}\n\nالرجاء الالتزام بالقوانين\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n↯ اسم القروب » {المجموعه}")
if welcome then
rules = (redis:get(wegz..'rulse:msg'..msg.chat_id_) or "↯ مرحباً عزيري القوانين كلاتي .\n↯ ممنوع نشر الروابط\n↯ ممنوع التكلم او نشر صور اباحيه\n↯ ممنوع  اعاده توجيه\n↯ ممنوع التكلم بالسياسة\n↯ الرجاء احترام المدراء والادمنيه .\n")
welcome = welcome:gsub("{القوانين}", rules)
if data.username_ then UserName = '@'..data.username_ else UserName = '< لا يوجد معرف >' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(wegz..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(data.first_name_..' '..(data.last_name_ or "" ),20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end)
else
welcome = (redis:get(wegz..'welcome:msg'..msg.chat_id_) or "↯ اهلن بك عزيزي {الاسم}\n↯ معرفك » {المعرف}\n{القوانين}\n\nالرجاء الالتزام بالقوانين\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n↯ اسم القروب » {المجموعه}")
if welcome then
rules = (redis:get(wegz..'rulse:msg'..msg.chat_id_) or "↯ مرحباً عزيري القوانين كلاتي .\n↯ ممنوع نشر الروابط\n↯ ممنوع التكلم او نشر صور اباحيه\n↯ ممنوع  اعاده توجيه\n↯ ممنوع التكلم بالسياسة\n↯ الرجاء احترام المدراء والادمنيه\n")
welcome = welcome:gsub("{القوانين}", rules)
if msg.addusername then UserName = '@'..msg.addusername else UserName = '< لا يوجد معرف >' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(wegz..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(msg.addname,20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end

end
end
end 

--------------------------------------------
if msg.adduser and redis:get(wegz..'welcome:get'..msg.chat_id_) then
local adduserx = tonumber(redis:get(wegz..'user:'..msg.sender_user_id_..':msgs') or 0)
if adduserx > 3 then 
redis:del(wegz..'welcome:get'..msg.chat_id_)
end
redis:setex(wegz..'user:'..msg.sender_user_id_..':msgs',3,adduserx+1)
end

if not msg.Admin and not msg.Special and not (msg.adduser or msg.joinuser or msg.deluser ) then -- للاعضاء فقط   

if not msg.forward_info and redis:get(wegz..'lock_flood'..msg.chat_id_)  then
local msgs = (redis:get(wegz..'user:'..msg.sender_user_id_..':msgs') or 0)
local NUM_MSG_wegz = (redis:get(wegz..'num_msg_wegz'..msg.chat_id_) or 5)
if tonumber(msgs) > tonumber(NUM_MSG_wegz) then 
GetUserID(msg.sender_user_id_,function(arg,datau)
Restrict(msg.chat_id_,msg.sender_user_id_,1)
redis:setex(wegz..'sender:'..msg.sender_user_id_..':flood',30,true)
if datau.username_ then USERNAME = '@'..datau.username_ else USERNAME = FlterName(datau.first_name_..' '..(datau.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,datau.id_,msg.id_,"↯ العضو » "..USERNAME.."\n↯ قمـت بتكرار اكثر مـن "..NUM_MSG_wegz.." رسالة‌‏ , لذا تم تقييدك مـن المجموعه‌\n",12,USERCAR) 
return false
end)
end 
redis:setex(wegz..'user:'..msg.sender_user_id_..':msgs',2,msgs+1)
end
 
 function Get_Info(msg,chat,user) --// ارسال نتيجة الصلاحيه
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
return sendMsg(msg.chat_id_,msg.id_,'↯ صلاحياته منشئ القروب\n')   
end 
if Json_Info.result.status == "member" then
return sendMsg(msg.chat_id_,msg.id_,'↯ مجرد عضو هنا\n')   
end 
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end
return sendMsg(chat,msg.id_,'↯ الرتبة : مشرف\n↯ والصلاحيات هي ↓ \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n↯ تغير معلومات المجموعه ↞ ❪ '..info..' ❫\n↯ حذف الرسائل ↞𖣐 ❪ '..delete..' ❫\n↯ حظر المستخدمين ↞𖣐 ❪ '..restrict..' ❫\n↯ دعوة مستخدمين ↞𖣐 ❪ '..invite..' ❫\n↯ تثبيت الرسائل ↞𖣐 ❪ '..pin..' ❫\n↯ اضافة مشرفين جدد ↞𖣐 ❪ '..promote..' ❫\n\n↯ ملاحضه » علامة ❪  ꪜ ❫ تعني لديه الصلاحية وعلامة ❪ ✘ ❫ تعني ليس ليديه الصلاحيه')   
end
end
end

if msg.forward_info_ then
if redis:get(wegz..'mute_forward'..msg.chat_id_) then -- قفل التوجيه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd \27[0m")

if data.ID == "Error" and data.code_ == 6 then 
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) and not redis:get(wegz..':User_Fwd_Msg:'..msg.sender_user_id_..':flood') then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذراً ممنوع اعادة التوجيه  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) 
return redis:setex(wegz..':User_Fwd_Msg:'..msg.sender_user_id_..':flood',15,true)
end,nil)
end
end)
return false
elseif redis:get(wegz..':tqeed_fwd:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd tqeed \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false 
end
elseif tonumber(msg.via_bot_user_id_) ~= 0 and redis:get(wegz..'mute_inline'..msg.chat_id_) then -- قفل الانلاين
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send inline \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذراً الانلاين مقفول  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text then -- رسايل فقط
if utf8.len(msg.text) > 500 and redis:get(wegz..'lock_spam'..msg.chat_id_) then -- قفل الكليشه 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send long msg \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ ممنوع ارسال الكليشه والا سوف تجبرني على طردك  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") 
or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.text:match(".[Pp][Ee]") 
or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.text:match("[Hh][Tt][Tt][Pp]://") 
or msg.text:match("[Ww][Ww][Ww].") 
or msg.text:match(".[Cc][Oo][Mm]")) 
and redis:get(wegz..':tqeed_link:'..msg.chat_id_)  then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user i restricted becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false
elseif(msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Oo][Rr][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match(".[Pp][Ee]")) 
and redis:get(wegz..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ ممنوع ارسال الروابط  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]") or msg.text:match(".[Tt][Kk]") or msg.text:match(".[Mm][Ll]") or msg.text:match(".[Oo][Rr][Gg]")) and redis:get(wegz..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ ممنوع ارسال روابط الويب   \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("#[%a%d_]+") and redis:get(wegz..'lock_tag'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send tag \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ ممنوع ارسال التاك  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("@[%a%d_]+")  and redis:get(wegz..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ ممنوع ارسال المعرف   \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) 
end,nil)
end
end)
return false
elseif not msg.textEntityTypeBold and (msg.textEntityTypeBold or msg.textEntityTypeItalic) and redis:get(wegz..'lock_markdown'..msg.chat_id_) then 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send markdown \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ ممنوع ارسال الماركدوان  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.textEntityTypeTextUrl and redis:get(wegz..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web page \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ ممنوع ارسال روابط الويب   \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
 
elseif msg.edited and redis:get(wegz..'lock_edit'..msg.chat_id_) then -- قفل التعديل
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Edit \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذراً ممنوع التعديل تم المسح \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end 
elseif msg.content_.ID == "MessageUnsupported" and redis:get(wegz..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذرا ممنوع ارسال الفيديو كام \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.photo then
if redis:get(wegz..'mute_photo'..msg.chat_id_)  then -- قفل الصور
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذرا ممنوع ارسال الصور  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif redis:get(wegz..':tqeed_photo:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user resctricted becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.video then
if redis:get(wegz..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send vedio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذرا ممنوع ارسال الفيديو  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(wegz..':tqeed_video:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.document and redis:get(wegz..'mute_document'..msg.chat_id_) then -- قفل الملفات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send file \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
 if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذرا ممنوع ارسال الملفات  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.sticker and redis:get(wegz..'mute_sticker'..msg.chat_id_) then --قفل الملصقات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send sticker \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذرا ممنوع ارسال الملصقات  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.animation then
if redis:get(wegz..'mute_gif'..msg.chat_id_) then -- قفل المتحركه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذرا ممنوع ارسال الصور المتحركه  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(wegz..':tqeed_gif:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.contact and redis:get(wegz..'mute_contact'..msg.chat_id_) then -- قفل الجهات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Contact \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
 if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذرا ممنوع ارسال جهات الاتصال  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.location and redis:get(wegz..'mute_location'..msg.chat_id_) then -- قفل الموقع
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send location \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
 if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذرا ممنوع ارسال الموقع  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.voice and redis:get(wegz..'mute_voice'..msg.chat_id_) then -- قفل البصمات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send voice \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
 if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذرا ممنوع ارسال البصمات  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.game and redis:get(wegz..'mute_game'..msg.chat_id_) then -- قفل الالعاب
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send game \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذرا ممنوع لعب الالعاب  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.audio and redis:get(wegz..'mute_audio'..msg.chat_id_) then -- قفل الصوت
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send audio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذرا ممنوع ارسال الصوت  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.replyMarkupInlineKeyboard and redis:get(wegz..'mute_keyboard'..msg.chat_id_) then -- كيبورد
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send keyboard \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذرا الكيبورد مقفول  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end

if msg.content_ and msg.content_.caption_ then -- الرسايل الي بالكابشن
print("sdfsd     f- ---------- ")
if (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.content_.caption_:match("[Tt].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match(".[Pp][Ee]")) 
and redis:get(wegz..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذرا ممنوع ارسال الروابط  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") 
or msg.content_.caption_:match("[Ww][Ww][Ww].") 
or msg.content_.caption_:match(".[Cc][Oo][Mm]")) 
and redis:get(wegz..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send webpage caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "↯ عذرا ممنوع ارسال روابط الويب  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.content_.caption_:match("@[%a%d_]+") and redis:get(wegz..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'↯ لا يمكنني مسح الرساله المخالفه .\n↯ لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(wegz..'lock_woring'..msg.chat_id_) then
local msgx = "↯ عذرا ممنوع ارسال التاك او المعرف  \n"
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"↯ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end 
end)
return false
end 

end --========{ End if } ======

end 
SaveNumMsg(msg)
------------------------------{ Start Replay Send }------------------------

if msg.text and redis:get(wegz..'replay'..msg.chat_id_) then

local Replay = false

 Replay = redis:hget(wegz..'replay:all',msg.text)
if Replay then
sendMsg(msg.chat_id_,msg.id_,Replay)
return false
end

 Replay = redis:hget(wegz..'replay:'..msg.chat_id_,msg.text)
if Replay then 
 sendMsg(msg.chat_id_,msg.id_,Replay) 
return false
end
 Replay = redis:hget(wegz..'replay_photo:group:',msg.text)
if Replay then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(wegz..'replay_voice:group:',msg.text)
if Replay then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(wegz..'replay_animation:group:',msg.text)
if Replay then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(wegz..'replay_audio:group:',msg.text)
if Replay then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(wegz..'replay_sticker:group:',msg.text)
if Replay then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(wegz..'replay_video:group:',msg.text)
if Replay then 
print("0000000000000") 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(wegz..'replay_photo:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(wegz..'replay_voice:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(wegz..'replay_animation:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(wegz..'replay_audio:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(wegz..'replay_sticker:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(wegz..'replay_video:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

if not Replay then

--================================{{  Reply Bot  }} ===================================

local nnn = {
"اسمي ["..Bot_Name.."] .",
"تدلل .",
"تفضل .",
"عيوني لك .",
"لبيه .",
}

local Text = msg.text
local Text2 = Text:match("^"..Bot_Name.." (%d+)$")

if msg.SudoUser and Text == Bot_Name and not Text2 then
return sendMsg(msg.chat_id_,msg.id_,su[math.random(#su)])
elseif not msg.SudoUser and Text== Bot_Name and not Text2 then  
return sendMsg(msg.chat_id_,msg.id_,ss97[math.random(#ss97)])
elseif Text:match("^قول (.*)$") then
if utf8.len(Text:match("^قول (.*)$")) > 500 then 
return sendMsg(msg.chat_id_,msg.id_,"↯  ما اقول اقدر اكثر من 500 حرف")
end
local callback_Text = FlterName(Text:match("^قول (.*)$"),50)
if callback_Text and callback_Text == 'الاسم سبام' then
return sendMsg(msg.chat_id_,msg.id_,"↯  للاسف النص هذا مخالف ")
else
return sendMsg(msg.chat_id_,0,callback_Text) 
end
elseif not msg.SudoUser and Text==" باي" or Text == "باي" then
return sendMsg(msg.chat_id_,msg.id_,dr[math.random(#dr)])
elseif not msg.SudoUser and Text==" بوت" or Text == "بوت" then
return 
sendMsg(msg.chat_id_,msg.id_,nnn[math.random(#nnn)]) 
elseif Text== "أحمد" or Text== "أحمد" then return  sendMsg(msg.chat_id_,msg.id_,"[مبرمج سليندر](https://t.me/ahmedyad200)")
elseif Text== "ملك التلجرام" or Text== "مطور السورس" then return  sendMsg(msg.chat_id_,msg.id_,"[أحمد عياد ♧](https://t.me/ahmedyad200)")
elseif Text== "رفع غبي"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم رفع الغبي بنجاح↯\nٴ𐄬 تمت إضافته إلى قائمه الأغبياء\n𖣐")
elseif Text== "تنزيل غبي"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم تنزيل الغبي بنجاح↯\nٴ𐄬 تمت الزاله من قائمه الأغبياء\n𖣐")
elseif Text== "رفع كلب"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم رفع الكلب بنجاح↯\nٴ𐄬 تمت إضافته إلى قائمه الكلاب\n𖣐")
elseif Text== "رفع حمار"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم رفع الحمار بنجاح↯\nٴ𐄬 تمت إضافته إلى قائمه الحمير\n𖣐")
elseif Text== "تنزيل حمار"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم تنزيل الحمار بنجاح↯\nٴ𐄬 تمت ازالته من قائمه الحمير\n𖣐")
elseif Text== "تنزيل كلب"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي \nٴ𐄬 تم تنزيل الكلب بنجاح↯\nٴ𐄬 تمت إزالته من قائمه الكلاب\n𖣐")
elseif Text== "تنزيل متوحده"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم تنزيل المتوحده بنجاح↯\nٴ𐄬 لا متحاولوش حتي لو نزلتوها هتفضل متوحده\n𖣐")
elseif Text== "رفع متوحده"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم رفع المتوحده بنجاح↯\nٴ𐄬 تمت إضافتها الي قائمة المتوحدين والمتخلفين عقلياً\n𖣐")
elseif Text== "رفع متوحد"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم رفع المتوحد بنجاح↯\nٴ𐄬 تمت  اضافته الي قائمة المتوحديد والمرضي النفسيين\n𖣐")
elseif Text== "تنزيل متوحد"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم تنزيل المتوحد بنجاح↯\nٴ𐄬 لا متحاولوش حتي لو نزلتوه هيفضل متوحد\n𖣐")
elseif Text== "رفع بقلبي"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم رفع العضو داخل قلبك↯\nٴ𐄬 تمت ترقيته بنجاح\n𖣐")
elseif Text== "تنزيل من قلبي"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم تنزيل من داخل قلبك↯\nٴ𐄬 تمت ازالته من قائمه القلوب\n𖣐")
elseif Text== "رفع وتكه"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم رفع العضو وتكه بنجاح↯ \nٴ𐄬 اصبحت وتكتك\n𖣐")
elseif Text== "تنزيل وتكه"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم تنزيل العضو \nٴ𐄬 من قائمة وتكاتك بنجاح\n𖣐")
elseif Text== "رفع زوجتي"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم رفع العضو زوجتك↯\nالآن يمكنكم أخذ راحتكم واتفضلو اعملو واحد\n𖣐")
elseif Text== "تنزيل زوجتي"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم تنزيل زوجتك بنجاح↯\nالآن انتم مفترقان طلعو بقا \n𖣐")
elseif Text== "زواج"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم زواجكم الاثنين بنجاح↯\nٴ𐄬 الآن هي حلالك بلالك\n𖣐")
elseif Text== "طلاق"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 اهلاً عزيزي\nٴ𐄬 تم طلاق الخاينه بنجاح↯\nٴ𐄬 الآن هي مطلقه \n𖣐")
elseif Text== "اوامر التسليه"  then return sendMsg(msg.chat_id_,msg.id_,"\n‌‌‏ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬\nٴ𐄬 مرحباً عزيزي\nٴ𐄬 هذي اوامر التسليه:  \nٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬\nٴ𐄬 رفع › تنزيل ❬ متوحد ❭\nٴ𐄬 رفع › تنزيل ❬ وتكه ❭\nٴ𐄬 رفع › تنزيل ❬ غبي ❭\nٴ𐄬 رفع › تنزيل ❬ كلب ❭\nٴ𐄬 رفع › تنزيل ❬ حمار ❭\nٴ𐄬 رفع › تنزيل ❬ زوجتي ❭\nٴ𐄬 رفع › تنزيل ❬ متوحده ❭\nٴ𐄬 رفع › ❬ بقلبي ❭ تنزيل › ❬ من قلبي❭\nٴ𐄬 ❬ طلاق ❭ › ❬ زواج ❭\nٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬")


 elseif Text== "ايديي" or Text=="ايدي ☆" then 
  GetUserID(msg.sender_user_id_,function(arg,data)
  if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
  local USERCAR = utf8.len(USERNAME)
  SendMention(msg.chat_id_,data.id_,msg.id_,"• اضغط على الايدي ليتم النسخ\n\n "..USERNAME.." ~⪼ ( "..data.id_.." )",37,USERCAR)  
  return false
  end)
  elseif Text=="ابي رابط الحذف" or Text=="ابي رابط حذف" or Text=="رابط حذف" or Text=="رابط الحذف" or Text=="رابط" then
  return sendMsg(msg.chat_id_,msg.id_,[[
 رابط الحذف في جميع مواقع التواصل ✸
فكر قبل لا تتسرع وتروح
ٴ——————𖣐wegz𖣐——————
❆رابط حذف  [Telegram](https://my.telegram.org/auth?to=delete) ܁
❆رابط حذف [instagram](https://www.instagram.com/accounts/login/?next=/accounts/remove/request/permanent/) ܁
❆رابط حذف [Facebook](https://www.facebook.com/help/deleteaccount) ܁
❆رابط حذف [Snspchat](https://accounts.snapchat.com/accounts/login?continue=https%3A%2F%2Faccounts.snapchat.com%2Faccounts%2Fdeleteaccount) ܁
  ]] )
  --=====================================
  elseif Text== " احمد" or Text== "  احمد " or Text==" احمد" then
if msg.SudoUser then  
return sendMsg(msg.chat_id_,msg.id_,"[مطور السورس.](https://t.me/ahmedyad300) ")
elseif msg.Creator then 
return sendMsg(msg.chat_id_,msg.id_,"[مطور السورس.](https://t.me/ahmedyad300")
elseif msg.Director then 
return sendMsg(msg.chat_id_,msg.id_,"[مطور السورس.](https://t.me/ahmedyad300")
elseif msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,"[مطور السورس.](https://t.me/ahmedyad300")
else 
return sendMsg(msg.chat_id_,msg.id_,"[مطور السورس.](https://t.me/ahmedyad300")
end 
end 




end 


end


------------------------------{ End Replay Send }------------------------

------------------------------{ Start Checking CheckExpire }------------------------
if not redis:get('kar') then
  redis:setex('kar',86400,true) 
  json_data = '{"BotID": '..wegz..',"UserBot": "'..Bot_User..'","Groups" : {'
  local All_Groups_ID = redis:smembers(wegz..'group:ids')
  for key,GroupS in pairs(All_Groups_ID) do
  local NameGroup = (redis:get(wegz..'group:name'..GroupS) or '')
  NameGroup = NameGroup:gsub('"','')
  NameGroup = NameGroup:gsub([[\]],'')
  if key == 1 then
  json_data =  json_data ..'"'..GroupS..'":{"Title":"'..NameGroup..'"'
  else
  json_data =  json_data..',"'..GroupS..'":{"Title":"'..NameGroup..'"'
  end
  local admins = redis:smembers(wegz..'admins:'..GroupS)
  if #admins ~= 0 then
  json_data =  json_data..',"Admins" : {'
  for key,value in pairs(admins) do
  local info = redis:hgetall(wegz..'username:'..value)
  if info then 
  UserName_ = (info.username or "")
  UserName_ = UserName_:gsub([[\]],'')
  UserName_ = UserName_:gsub('"','')
  end 
  if key == 1 then
  json_data =  json_data..'"'..UserName_..'":'..value
  else
  json_data =  json_data..',"'..UserName_..'":'..value
  end
  end
  json_data =  json_data..'}'
  end
  
  local creators = redis:smembers(wegz..':MONSHA_BOT:'..GroupS)
  if #creators ~= 0 then
  json_data =  json_data..',"Creator" : {'
  for key,value in pairs(creators) do
  local info = redis:hgetall(wegz..'username:'..value)
  if info then 
  UserName_ = (info.username or "")
  UserName_ = UserName_:gsub([[\]],'')
  UserName_ = UserName_:gsub('"','')
  end 
  if key == 1 then
  json_data =  json_data..'"'..UserName_..'":'..value
  else
  json_data =  json_data..',"'..UserName_..'":'..value
  end 
  end
  json_data =  json_data..'}'
  end
  local creator = redis:smembers(wegz..':KARA_BOT:'..GroupS)
  if #creator ~= 0 then
  json_data =  json_data..',"Kara" : {'
  for key,value in pairs(creator) do
  local info = redis:hgetall(wegz..'username:'..value)
  if info then 
  UserName_ = (info.username or "")
  UserName_ = UserName_:gsub([[\]],'')
  UserName_ = UserName_:gsub('"','')
  end 
  if key == 1 then
  json_data =  json_data..'"'..UserName_..'":'..value
  else
  json_data =  json_data..',"'..UserName_..'":'..value
  end 
  end
  json_data =  json_data..'}'
  end
  
  local owner = redis:smembers(wegz..'owners:'..GroupS)
  if #owner ~= 0 then
  json_data =  json_data..',"Owner" : {'
  for key,value in pairs(owner) do
  local info = redis:hgetall(wegz..'username:'..value)
  if info then 
  UserName_ = (info.username or "")
  UserName_ = UserName_:gsub([[\]],'')
  UserName_ = UserName_:gsub('"','')
  end 
  if key == 1 then
  json_data =  json_data..'"'..UserName_..'":'..value
  else
  json_data =  json_data..',"'..UserName_..'":'..value
  end
  end
  json_data =  json_data..'}'
  end
  json_data =  json_data.."}"
  end
  local Save_Data = io.open("./inc/"..Bot_User..".json","w+")
  Save_Data:write(json_data..'}}')
  Save_Data:close()
  sendDocument(SUDO_ID,0,"./inc/"..Bot_User..".json","↯ ملف نسخه تلقائيه\n↯   اليك مجموعاتك » { "..#All_Groups_ID.." }\n↯ للبوت » "..Bot_User.."\n↯ التاريخ » "..os.date("%Y/%m/%d").."\n",dl_cb,nil)
  end
  if redis:get(wegz..'CheckExpire::'..msg.chat_id_) then
  local ExpireDate = redis:ttl(wegz..'ExpireDate:'..msg.chat_id_)
  if not ExpireDate and not msg.SudoUser then
  rem_data_group(msg.chat_id_)
  sendMsg(SUDO_ID,0,'↯ انتهى الاشتراك في احد المجموعات .\n↯ المجموعه : '..FlterName(redis:get(wegz..'group:name'..msg.chat_id_))..'.\n↯ ايدي : '..msg.chat_id_)
  sendMsg(msg.chat_id_,0,'↯ انتهى الاشتراك البوت.\n↯ سوف اغادر المجموعه فرصه سعيده .\n↯ او راسل المطور للتجديد '..SUDO_USER..' 🍃')
  return StatusLeft(msg.chat_id_,our_id)
  else
  local DaysEx = (redis:ttl(wegz..'ExpireDate:'..msg.chat_id_) / 86400)
  if tonumber(DaysEx) > 0.208 and ExpireDate ~= -1 and msg.Admin then
  if tonumber(DaysEx + 1) == 1 and not msg.SudoUser then
  sendMsg(msg.chat_id_,'↯ باقي يوم واحد وينتهي الاشتراك .\n↯ راسل المطور للتجديد '..SUDO_USER..'\n')
  end 
  end 
  end
  end
  
  ------------------------------{ End Checking CheckExpire }------------------------
  
  
  end 
  
  
  return {
  wegz = {
  "^(تقييد)$",
  "^(تقييد) (%d+)$",
  "^(تقييد) (@[%a%d_]+)$",
  "^(فك التقييد)$",
  "^(فك التقييد) (%d+)$",
  "^(فك التقييد) (@[%a%d_]+)$",
  "^(فك تقييد)$",
  "^(فك تقييد) (%d+)$",
  "^(فك تقييد) (@[%a%d_]+)$",
  "^(ضع شرط التفعيل) (%d+)$",
  "^(التفاعل)$",
  "^(التفاعل) (@[%a%d_]+)$",
  "^([iI][dD])$",
  "^(تفعيل الايدي بالصوره)$",
  "^(تعطيل الايدي بالصوره)$",
  "^(تعطيل الرفع)$",
  "^(تفعيل الرفع)$",
  "^(قفل الدخول بالرابط)$",
  "^(فتح الدخول بالرابط)$", 
  "^(ايدي)$",
  "^(ايدي) (@[%a%d_]+)$",
  "^(كشف)$",
  "^(كشف) (%d+)$",
  "^(كشف) (@[%a%d_]+)$",
  '^(رفع مميز)$',
  '^(رفع مميز) (@[%a%d_]+)$',
  '^(رفع مميز) (%d+)$',
  '^(تنزيل مميز)$',
  '^(تنزيل مميز) (@[%a%d_]+)$',
  '^(تنزيل مميز) (%d+)$',
  '^(رفع ادمن)$',
  '^(رفع ادمن) (@[%a%d_]+)$',
  '^(رفع ادمن) (%d+)$',
  '^(تنزيل ادمن)$',
  '^(تنزيل ادمن) (@[%a%d_]+)$',
  '^(تنزيل ادمن) (%d+)$', 
  '^(رفع مطي)$',
  '^(تنزيل مطي)$', 
  '^(رفع زاحف)$',
  '^(تنزيل زاحف)$', 
  '^(رفع المدير)$',
  '^(رفع مدير)$', 
  '^(رفع مدير) (@[%a%d_]+)$',
  '^(رفع المدير) (@[%a%d_]+)$',
  '^(رفع المدير) (%d+)$',
  '^(رفع مدير) (%d+)$',
  '^(رفع منشى اساسي)$',
  '^(رفع منشئ اساسي)$',
  '^(رفع منشئ اساسي) (@[%a%d_]+)$',
  '^(رفع منشى اساسي) (@[%a%d_]+)$',
  '^(تنزيل منشئ اساسي)$',
  '^(تنزيل منشى اساسي)$',
  '^(تنزيل منشئ اساسي) (%d+)$',
  '^(تنزيل منشى اساسي) (%d+)$',
  '^(تنزيل منشى اساسي) (@[%a%d_]+)$',
  '^(تنزيل منشئ اساسي) (@[%a%d_]+)$',
  '^(رفع منشى)$',
  '^(رفع منشئ)$',
  '^(رفع منشئ) (@[%a%d_]+)$',
  '^(رفع منشى) (@[%a%d_]+)$',
  '^(تنزيل منشئ)$',
  '^(تنزيل منشى)$',
  '^(تنزيل منشئ) (%d+)$',
  '^(تنزيل منشى) (%d+)$',
  '^(تنزيل منشى) (@[%a%d_]+)$',
  '^(تنزيل منشئ) (@[%a%d_]+)$',
  '^(تنزيل المدير)$',
  '^(تنزيل مدير)$',
  '^(تنزيل مدير) (@[%a%d_]+)$',
  '^(تنزيل المدير) (@[%a%d_]+)$',
  '^(تنزيل المدير) (%d+)$',
  '^(تنزيل مدير) (%d+)$',
   '^(صلاحياته)$',
   '^(صلاحياتي)$',
  '^(صلاحياته) (@[%a%d_]+)$',
  '^(قفل) (.+)$',
  '^(فتح) (.+)$',
  '^(تفعيل)$',
  '^(تفعيل) (.+)$',
  '^(تعطيل)$',
  '^(تعطيل) (.+)$',
  '^(ضع تكرار) (%d+)$',
  "^(مسح)$",
  "^(مسح) (.+)$",
  '^(منع) (.+)$',
  '^(الغاء منع) (.+)$',
  "^(حظر عام)$",
  "^(حظر عام) (@[%a%d_]+)$",
  "^(حظر عام) (%d+)$",
  "^(الغاء العام)$",
  "^(الغاء العام) (@[%a%d_]+)$",
  "^(الغاء العام) (%d+)$",
  "^(الغاء عام)$",
  "^(الغاء عام) (@[%a%d_]+)$",
  "^(الغاء عام) (%d+)$",
  "^(حظر)$",
  "^(حظر) (@[%a%d_]+)$",
  "^(حظر) (%d+)$",
  "^(الغاء الحظر)$", 
  "^(الغاء الحظر) (@[%a%d_]+)$",
  "^(الغاء الحظر) (%d+)$",
  "^(الغاء حظر)$", 
  "^(الغاء حظر) (@[%a%d_]+)$",
  "^(الغاء حظر) (%d+)$",
  "^(طرد)$",
  "^(طرد) (@[%a%d_]+)$",
  "^(طرد) (%d+)$",
  "^(كتم)$",
  "^(كتم) (@[%a%d_]+)$",
  "^(كتم) (%d+)$",
  "^(الغاء الكتم)$",
  "^(الغاء الكتم) (@[%a%d_]+)$",
  "^(الغاء الكتم) (%d+)$",
  "^(الغاء كتم)$",
  "^(الغاء كتم) (@[%a%d_]+)$",
  "^(الغاء كتم) (%d+)$",
  "^(رفع مطور)$",
  "^(رفع مطور) (@[%a%d_]+)$",
  "^(رفع مطور) (%d+)$",
  "^(تنزيل مطور)$",
  "^(تنزيل مطور) (%d+)$",
  "^(تنزيل مطور) (@[%a%d_]+)$",
  "^(تعطيل) (-%d+)$",
  "^(الاشتراك) ([123])$",
  "^(الاشتراك)$",
  "^(تنزيل الكل)$", 
  "^(شحن) (%d+)$",
  "^(المجموعه)$",
  "^(كشف البوت)$",
  "^(انشاء رابط)$",
  "^(ضع الرابط)$",
  "^(تثبيت)$",
  "^(الغاء التثبيت)$",
  "^(الغاء تثبيت)$",
  "^(رابط)$",
  "^(الرابط)$",
  "^(ضع رابط)$",
  "^(رابط خاص)$",
  "^(الرابط خاص)$",
  "^(القوانين)$",
  "^(ضع القوانين)$",
  "^(ضع قوانين)$",
  "^(ضع تكرار)$",
  "^(ضع التكرار)$",
  "^(الادمنيه)$",
  "^(تاك للكل)$",
  "^(نذار)$",
  "^(تاك)$",
  "^(قائمه المنع)$",
  "^(المدراء)$",
  "^(المميزين)$",
  "^(المكتومين)$",
  "^(ضع الترحيب)$",
  "^(الترحيب)$",
  "^(المنشى الاساسي)$",
  "^(المنشئ الاساسي)$",
  "^(المحظورين)$",
  "^(ضع اسم)$",
  "^(ضع صوره)$",
  "^(ضع وصف)$",
  "^(طرد البوتات)$",
  "^(كشف البوتات)$",
  "^(طرد المحذوفين)$",
  "^(رسائلي)$",
  "^(رسايلي)$",
  "^(احصائياتي)$",
  "^(معلوماتي)$",
  "^(مسح معلوماتي)$",
  "^(موقعي)$",
  "^(رفع الادمنيه)$",
  "^(صوره الترحيب)$",
  "^(ضع كليشه المطور)$",
  "^(المطور)$",
  "^(شرط التفعيل)$",
  "^(قائمه المجموعات)$",
  "^(المجموعات)$",
  "^(المجموعات 🌋)$",
  "^(المشتركين)$",
  "^(المشتركين Ⓜ)$",
  "^(اذاعه)$",
  "^(اذاعه عام)$",
  "^(اذاعه خاص)$",
  "^(اذاعه عام بالتوجيه)$",
  "^(اذاعه عام بالتوجيه)$", 
  "^(اذاعه خاص)$", 
  "^(اذاعه عام)$", 
  "^(اذاعه)$", 
  "^(قائمه العام)$",
  "^(قائمة العام)$",
  "^(المطورين)$",
  "^(المطورين)$",
  "^(تيست)$",
  "^(test)$",
  "^(ايديي🆔)$",
  "^(قناة السورس 📡)$",
  "^(الاحصائيات)$",
  "^(الاحصائيات 💥)$",
  "^(اضف رد عام)$",
  "^(اضف رد عام ➕)$",
  "^(مسح الردود)$",
  "^(مسح الردود العامه)$",
  "^(ضع اسم للبوت)$",
  "^(مسح الصوره)$",
  "^(مسح رد)$",
  "^(الردود)$",
  "^(الردود العامه)$",
  "^(الردود العامه 🗨)$",
  "^(اضف رد)$",
  "^(/UpdateSource)$",
  "^(تحديث السورس 🔂)$",
  "^(تحديث السورس)$",
  "^(تنظيف المجموعات)$",
  "^(تنظيف المشتركين)$",
  "^(تنظيف المجموعات 🗑)$",
  "^(تنظيف المشتركين 🗑)$",
  "^(رتبتي)$",
  "^(ضع اسم للبوت ©)$",
  "^(ضع صوره للترحيب 🌄)$",
  "^(ضع صوره للترحيب)$",
  "^(الحمايه)$",
  "^(الاعدادات)$",
  "^(الوسائط)$",
  "^( ✖️)$",
  "^(الرتبه)$",
  "^(الغاء)$",
  "^(سحكاتي)$",
  "^(اسمي)$",
  "^(التاريخ)$",
  "^(/[Ss]tore)$",
  "^(اصدار السورس)$",
  "^(الاصدار)$",
  "^(server)$",
  "^(السيرفر)$",
  "^(فحص البوت)$", 
  "^(نسخه احتياطيه للمجموعات)$",
  "^(رفع نسخه الاحتياطيه)$", 
  "^(تفعيل الاشتراك الاجباري)$", 
  "^(تعطيل الاشتراك الاجباري)$", 
  "^(تغيير الاشتراك الاجباري)$", 
  "^(الاشتراك الاجباري)$", 
  "^(تفعيل الاشتراك الاجباري ☑)$", 
  "^(تعطيل الاشتراك الاجباري ♻️)$", 
  "^(تغيير الاشتراك الاجباري 🔁)$", 
  "^(الاشتراك الاجباري ⚠️)$", 
  "^(احظرني)$", 
  "^(اطردني)$", 
  "^(جهاتي)$", 
  
  
  
  
  
  
  
  
  
  "^(السورس)$",
  "^(سورس)$",
  "^(م المطور)$", 
  "^(اوامر الرد)$",
  "^(الاوامر)$",
  "^(م1)$",
  "^(م2)$",
  "^(م3)$",
  "^(م4)$",
  "^(م5)$",
  "^(م6)$",
  "^(م7)$",
   
   
   },
   iwegz = iwegz,
   dwegz = dwegz,
   }
  