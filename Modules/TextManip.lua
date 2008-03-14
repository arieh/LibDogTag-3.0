local MAJOR_VERSION = "LibDogTag-3.0"
local MINOR_VERSION = tonumber(("$Revision$"):match("%d+")) or 0

if MINOR_VERSION > _G.DogTag_MINOR_VERSION then
	_G.DogTag_MINOR_VERSION = MINOR_VERSION
end

DogTag_funcs[#DogTag_funcs+1] = function(DogTag)

local L = DogTag.L

DogTag:AddTag("Base", "Percent", {
	code = [=[return ${number} .. '%']=],
	arg = {
		'number', 'number', '@req'
	},
	ret = "string",
	doc = L["Append a percentage sign to the end of number"],
	example = '[50:Percent] => "50%"; [Percent(50)] => "50%"',
	category = L["Text manipulation"]
})

DogTag:AddTag("Base", "Short", {
	code = [=[if ${value:type} == "number" then
		if ${value} >= 10000000 or ${value} <= -10000000 then
			return ("%.1fm"):format(${value} / 1000000)
		elseif ${value} >= 1000000 or ${value} <= -1000000 then
			return ("%.2fm"):format(${value} / 1000000)
		elseif ${value} >= 100000 or ${value} <= -100000 then
			return ("%.0fk"):format(${value} / 1000)
		elseif ${value} >= 10000 or ${value} <= -10000 then
			return ("%.1fk"):format(${value} / 1000)
		else
			return math_floor(${value}+0.5)..''
		end
	else
		local a,b = ${value}:match("^(%d+)/(%d+)$")
		if a then
			a, b = tonumber(a), tonumber(b)
			if a >= 10000000 or a <= -10000000 then
				a = ("%.1fm"):format(a / 1000000)
			elseif a >= 1000000 or a <= -1000000 then
				a = ("%.2fm"):format(a / 1000000)
			elseif a >= 100000 or a <= -100000 then
				a = ("%.0fk"):format(a / 1000)
			elseif a >= 10000 or a <= -10000 then
				a = ("%.1fk"):format(a / 1000)
			end
			if b >= 10000000 or b <= -10000000 then
				b = ("%.1fm"):format(b / 1000000)
			elseif b >= 1000000 or b <= -1000000 then
				b = ("%.2fm"):format(b / 1000000)
			elseif b >= 100000 or b <= -100000 then
				b = ("%.0fk"):format(b / 1000)
			elseif b >= 10000 or b <= -10000 then
				b = ("%.1fk"):format(b / 1000)
			end
			return a.."/"..b
		else
			return ${value}
		end
	end]=],
	arg = {
		'value', 'number;string', '@req'
	},
	ret = "string",
	globals = "math.floor",
	doc = L["Shorten value to have at maximum 3 decimal places showing"],
	example = '[1234:Short] => "1.23k"; [12345678:Short] => "12.3m"; ["1234/2345":Short] => "1.23k/2.35k"',
	category = L["Text manipulation"],
})

DogTag:AddTag("Base", "VeryShort", {
	code = [=[if ${value:type} == "number" then
		if ${value} >= 1000000 or ${value} <= -1000000 then
			return ("%.0fm"):format(${value} / 1000000)
		elseif ${value} >= 1000 or ${value} <= -1000 then
			return ("%.0fk"):format(${value} / 1000)
		else
			return math_floor(${value}+0.5)..''
		end
	else
		local a,b = ${value}:match("^(%d+)/(%d+)")
		if a then
			a, b = tonumber(a), tonumber(b)
			if b >= 1000000 or b <= -1000000 then
				b = ("%.0fm"):format(b / 1000000)
			elseif b >= 1000 or b <= -1000 then
				b = ("%.0fk"):format(b / 1000)
			end
			if a >= 1000000 or a <= -1000000 then
				a = ("%.0fm"):format(a / 1000000)
			elseif a >= 1000 or a <= -1000 then
				a = ("%.0fk"):format(a / 1000)
			end
			return a.."/"..b
		else
			return ${value}
		end
	end]=],
	arg = {
		'value', 'number;string', "@req"
	},
	ret = "number;string",
	globals = "math.floor",
	doc = L["Shorten value to its closest denomination"],
	example = '[1234:VeryShort] => "1k"; [123456:VeryShort] => "123k"; [Text(12345/23456):VeryShort] => "12k/23k"',
	category = L["Text manipulation"]
})

DogTag:AddTag("Base", "Upper", {
	code = [=[return ${value}:upper()]=],
	arg = {
		'value', 'string', '@req'
	},
	ret = "string",
	doc = L["Turn value into an uppercase string"],
	example = '["Hello":Upper] => "HELLO"',
	category = L["Text manipulation"]
})

DogTag:AddTag("Base", "Lower", {
	code = [=[return ${value}:lower()]=],
	arg = {
		'value', 'string', '@req'
	},
	ret = "string",
	doc = L["Turn value into an lowercase string"],
	example = '["Hello":Lower] => "hello"',
	category = L["Text manipulation"]
})

DogTag:AddTag("Base", "Bracket", {
	code = [=[return "[" .. ${value} .. "]"]=],
	arg = {
		'value', 'string', '@req'
	},
	ret = "string",
	doc = L["Wrap value with square brackets"],
	example = '["Hello":Bracket] => "[Hello]"',
	category = L["Text manipulation"]
})

DogTag:AddTag("Base", "Angle", {
	code = [=[return "<" .. ${value} .. ">"]=],
	arg = {
		'value', 'string', '@req'
	},
	ret = "string",
	doc = L["Wrap value with angle brackets"],
	example = '["Hello":Angle] => "<Hello>"',
	category = L["Text manipulation"]
})

DogTag:AddTag("Base", "Brace", {
	code = [=[return "{" .. ${value} .. "}"]=],
	arg = {
		'value', 'string', '@req'
	},
	ret = "string",
	doc = L["Wrap value with braces"],
	example = '["Hello":Brace] => "{Hello}"',
	category = L["Text manipulation"]
})

DogTag:AddTag("Base", "Paren", {
	code = [=[return "(" .. ${value} .. ")"]=],
	arg = {
		'value', 'string', '@req'
	},
	ret = "string",
	doc = L["Wrap value with parentheses"],
	example = '["Hello":Paren] => "(Hello)"',
	category = L["Text manipulation"]
})

DogTag:AddTag("Base", "Truncate", {
	code = [=[local len = 0
	for i = 1, ${number} do
		local b = ${value}:byte(len+1)
		if not b then
			shortened = false
			break
		elseif b <= 127 then
			len = len + 1
		elseif b <= 223 then
			len = len + 2
		elseif b <= 239 then
			len = len + 3
		else
			len = len + 4
		end
	end
	local val = ${value}:sub(1, len)
	if ${ellipses} and ${value}:byte(len+1) then
		val = val .. "..."
	end
	return val]=],
	arg = {
		'value', 'string', '@req',
		'number', 'number', '@req',
		'ellipses', 'nil;string', L["True"],
	},
	ret = "string",
	doc = L["Truncate value to the length specified by number, adding ellipses by default"],
	example = '["Hello":Truncate(3)] => "Hel..."; ["Hello":Truncate(3, nil)] => "Hel"',
	category = L["Text manipulation"]
})

DogTag:AddTag("Base", "Repeat", {
	code = [=[local val = ${value}:rep(${number})
	if val == "" then
		val = nil
	end
	return val]=],
	arg = {
		'value', 'string', '@req',
		'number', 'number', '@req',
	},
	ret = "string;nil",
	doc = L["Repeat value number times"],
	example = '["Hello":Rep(3)] => "HelloHelloHello"',
	category = L["Text manipulation"]
})

DogTag:AddTag("Base", "Length", {
	code = [=[local len = 0
	local num = 0
	while true do
		local b = ${value}:byte(len+1)
		if not b then
			break
		elseif b <= 127 then
			len = len + 1
		elseif b <= 223 then
			len = len + 2
		elseif b <= 239 then
		 	len = len + 3
		else
			len = len + 4
		end
		num = num + 1
	end
	return num]=],
	arg = {
		'value', 'string', "@req"
	},
	ret = "number",
	doc = L["Return the length of value"],
	example = '["Hello":Length] => "5"; ["Hi guys":Length] => "7"',
	category = L["Text manipulation"]
})

local romanizationData = {
	{"M", 1000},
	{"CM", 900},
	{"D", 500},
	{"CD", 400},
	{"C", 100},
	{"XC", 90},
	{"L", 50},
	{"XL", 40},
	{"X", 10},
	{"IX", 9},
	{"V", 5},
	{"IV", 4},
	{"I", 1}
}
local tmp = {}
local function romanize(value)
	if value >= 5000000 or value <= -5000000 then
		return tostring(value)
	end
	
	value = math.floor(value + 0.5)
	if value == 0 then
		return "N"
	end
	
	local neg = value < 0
	if neg then
		value = -value
		tmp[1] = "-"
	end
	
	if value >= 5000 then
		tmp[#tmp+1] = "("
		for i = 1, #romanizationData-2 do
			local v = romanizationData[i]
			while value >= v[2]*1000 do
				tmp[#tmp+1] = v[1]
				value = value - v[2]*1000
			end
		end
		tmp[#tmp+1] = ")"
	end
	
	for i,v in ipairs(romanizationData) do
		while value >= v[2] do
			tmp[#tmp+1] = v[1]
			value = value - v[2]
		end
	end
	local result = table.concat(tmp)
	for i = 1, #tmp do
		tmp[i] = nil
	end
	return result
end
DogTag:AddFakeGlobal("Base", "romanize", romanize)
DogTag:AddTag("Base", "Romanize", {
	code = [[return DogTag___romanize(${value})]],
	ret = "string",
	arg = {
		'value', 'number', "@req",
	},
	globals = "DogTag.__romanize",
	doc = L["Turn number_value into a roman numeral."],
	example = '[1666:Romanize] => "MDCLXVI"',
	category = L["Text manipulation"]
})

local function abbreviate(text)
	local b = text:byte(1)
	if b <= 127 then
		return text:sub(1, 1)
	elseif b <= 223 then
		return text:sub(1, 2)
	elseif b <= 239 then
		return text:sub(1, 3)
	else
		return text:sub(1, 4)
	end
end
DogTag:AddFakeGlobal("Base", "abbreviate", abbreviate)
DogTag:AddTag("Base", "Abbreviate", {
	code = [[if ${value}:find(" ") then
		return ${value}:gsub(" *([^ ]+) *", DogTag___abbreviate)
	else
		return ${value}
	end]],
	arg = {
		'value', 'string', "@req"
	},
	ret = "string",
	globals = "DogTag.__abbreviate",
	doc = L["Abbreviate value if a space is found"],
	example = '["Hello":Abbreviate] => "Hello"; ["Hello World":Abbreviate] => "HW"',
	category = L["Text Manipulation"],
})

end
