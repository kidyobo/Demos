-- Filename: DB_Sky_piea_floor.lua
-- Author: auto-created by XmlToScript tool.
-- Function: it`s auto-created by XmlToScript tool.

module("DB_Sky_piea_floor", package.seeall)

keys = {
	"id", "name", "type", "needLevel", "passRecover", "monsterModel", "gradeCount", "baseReward", "ranking", "simpleAdjust", "commonAdjust", "hardAdjust", "BloodOrRevive", "copyBackground", "fixedNumber", "goldNumber", "openCost", "random_buff", 
}

Sky_piea_floor = {
	id_1 = {1, "神秘空岛1层", 1, 10, "0|0", "2", "60000|10000|10000,20000|20000|20000,10000|30000|30000", "1|100|1,2|120|3,3|162|5", "1|2000|2600,2|1200|1800,3|700|875", "11|200,14|200,15|200,12|200,13|200", "11|400,14|400,16|400,12|400,13|400", "11|600,14|600,15|600,12|600,13|600", 0, "zhuoretudi.jpg", nil, nil, nil, nil, },
	id_2 = {2, "神秘空岛2层", 2, 10, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "1,1,1,1", "1,1", "1|10,3|20,5|40,7|80,8|120", nil, },
	id_3 = {3, "神秘空岛3层", 1, 10, "0|0", "1", "60000|10000|10000,20000|20000|20000,10000|30000|30000", "1|108|1,2|129|3,3|174|5", "1|1600|2080,2|1050|1575,3|600|750", "11|300,14|300,15|300,12|300,13|300", "11|600,14|600,16|600,12|600,13|600", "11|1000,14|1000,15|1000,12|1000,13|1000", 0, "zhuoretudi.jpg", nil, nil, nil, nil, },
	id_4 = {4, "神秘空岛4层", 3, 10, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "1001|1002|1003|1004|1005|1006|1007,1001|2001|1002|2002|1003|2003|1004|2004|1005|2005|1006|2006|1007|2008,1001|2001|1002|2002|1003|2003|1004|2004|1005|2005|1006|2006|1007|2008", },
	id_5 = {5, "神秘空岛5层", 1, 10, "0|0", "2", "60000|10000|10000,20000|20000|20000,10000|30000|30000", "1|116|1,2|139|3,3|187|5", "1|1200|1560,2|900|1199,3|500|625", "11|500,14|500,15|500,12|500,13|500", "11|800,14|800,16|800,12|800,13|800", "11|1300,14|1300,15|1300,12|1300,13|1300", 0, "zhuoretudi.jpg", nil, nil, nil, nil, },
	id_6 = {6, "神秘空岛6层", 2, 10, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "1,1,1,1", "1,1", "1|10,3|20,5|40,7|80,8|120", nil, },
	id_7 = {7, "神秘空岛7层", 1, 10, "0|0", "1", "60000|10000|10000,20000|20000|20000,10000|30000|30000", "1|124|1,2|148|3,3|199|5", "1|1050|1365,2|800|1049,3|400|500", "11|700,14|700,15|700,12|700,13|700", "11|1000,14|1000,16|1000,12|1000,13|1000", "11|1600,14|1600,15|1600,12|1600,13|1600", 0, "zhuoretudi.jpg", nil, nil, nil, nil, },
	id_8 = {8, "神秘空岛8层", 3, 10, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "1001|2001|1002|2002|1003|2003|1004|2004|1005|2005|1006|2006|1007|2008,1001|2001|3001|1002|2002|3002|1003|2003|3003|1004|2004|3004|1005|2005|3005|1006|2006|3006|1007|3007|2008|4008,1001|2001|3001|1002|2002|3002|1003|2003|3003|1004|2004|3004|1005|2005|3005|1006|2006|3006|1007|3007|2008|4008", },
	id_9 = {9, "神秘空岛9层", 1, 10, "0|0", "2", "60000|10000|10000,20000|20000|20000,10000|30000|30000", "1|132|1,2|158|3,3|213|5", "1|900|1170,2|700|899,3|300|375", "11|900,14|900,15|900,12|900,13|900", "11|1300,14|1300,16|1300,12|1300,13|1300", "11|1900,14|1900,15|1900,12|1900,13|1900", 0, "zhuoretudi.jpg", nil, nil, nil, nil, },
	id_10 = {10, "神秘空岛10层", 2, 10, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "1,1,1,1", "1,1", "1|10,3|20,5|40,7|80,8|120", nil, },
	id_11 = {11, "神秘空岛11层", 1, 10, "0|0", "1", "60000|10000|10000,20000|20000|20000,10000|30000|30000", "1|140|1,2|168|3,3|226|5", "1|800|1040,2|600|799,3|200|250", "11|1100,14|1100,15|1100,12|1100,13|1100", "11|1600,14|1600,16|1600,12|1600,13|1600", "11|2200,14|2200,15|2200,12|2200,13|2200", 0, "zhuoretudi.jpg", nil, nil, nil, nil, },
	id_12 = {12, "神秘空岛12层", 3, 10, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "1001|2001|3001|1002|2002|3002|1003|2003|3003|1004|2004|3004|1005|2005|3005|1006|2006|3006|1007|3007|2008|4008,1001|2001|3001|4001|1002|2002|3002|4002|1003|2003|3003|4003|1004|2004|3004|4004|1005|2005|3005|4005|1006|2006|3006|4006|1007|3007|2008|4008|1009|2009,1001|2001|3001|4001|1002|2002|3002|4002|1003|2003|3003|4003|1004|2004|3004|4004|1005|2005|3005|4005|1006|2006|3006|4006|1007|3007|2008|4008|1009|2009", },
	id_13 = {13, "神秘空岛13层", 1, 10, "0|0", "2", "60000|10000|10000,20000|20000|20000,10000|30000|30000", "1|148|1,2|177|3,3|238|5", "1|700|910,2|500|699,3|150|188", "11|1300,14|1300,15|1300,12|1300,13|1300", "11|1900,14|1900,16|1900,12|1900,13|1900", "11|2500,14|2500,15|2500,12|2500,13|2500", 0, "zhuoretudi.jpg", nil, nil, nil, nil, },
	id_14 = {14, "神秘空岛14层", 2, 10, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "1,1,1,1", "1,1", "1|10,3|20,5|40,7|80,8|120", nil, },
	id_15 = {15, "神秘空岛15层", 1, 10, "0|0", "1", "60000|10000|10000,20000|20000|20000,10000|30000|30000", "1|156|1,2|187|3,3|252|5", "1|600|780,2|400|599,3|100|125", "11|1500,14|1500,15|1500,12|1500,13|1500", "11|2200,14|2200,16|2200,12|2200,13|2200", "11|2800,14|2800,15|2800,12|2800,13|2800", 0, "zhuoretudi.jpg", nil, nil, nil, nil, },
	id_16 = {16, "神秘空岛16层", 3, 10, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "1001|2001|3001|4001|1002|2002|3002|4002|1003|2003|3003|4003|1004|2004|3004|4004|1005|2005|3005|4005|1006|2006|3006|4006|1007|3007|2008|4008|1009|2009,1001|2001|3001|4001|5001|1002|2002|3002|4002|5002|1003|2003|3003|4003|5003|1004|2004|3004|4004|5004|1005|2005|3005|4005|5005|1006|2006|3006|4006|5006|1007|3007|5007|2008|4008|5008|1009|2009|3009|4009|3010,1001|2001|3001|4001|5001|1002|2002|3002|4002|5002|1003|2003|3003|4003|5003|1004|2004|3004|4004|5004|1005|2005|3005|4005|5005|1006|2006|3006|4006|5006|1007|3007|5007|2008|4008|5008|1009|2009|3009|4009|3010", },
	id_17 = {17, "神秘空岛17层", 1, 10, "0|0", "2", "60000|10000|10000,20000|20000|20000,10000|30000|30000", "1|164|1,2|196|3,3|264|5", "1|500|650,2|300|450,3|80|100", "11|1700,14|1700,15|1700,12|1700,13|1700", "11|2500,14|2500,16|2500,12|2500,13|2500", "11|3100,14|3100,15|3100,12|3100,13|3100", 0, "zhuoretudi.jpg", nil, nil, nil, nil, },
	id_18 = {18, "神秘空岛18层", 2, 10, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "1,1,1,1", "1,1", "1|10,3|20,5|40,7|80,8|120", nil, },
	id_19 = {19, "神秘空岛19层", 1, 10, "0|0", "1", "60000|10000|10000,20000|20000|20000,10000|30000|30000", "1|172|1,2|206|3,3|278|5", "1|400|520,2|150|225,3|60|75", "11|1900,14|1900,15|1900,12|1900,13|1900", "11|2800,14|2800,16|2800,12|2800,13|2800", "11|3400,14|3400,15|3400,12|3400,13|3400", 0, "zhuoretudi.jpg", nil, nil, nil, nil, },
	id_20 = {20, "神秘空岛20层", 3, 10, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "1001|2001|3001|4001|1002|2002|3002|4002|1003|2003|3003|4003|1004|2004|3004|4004|1005|2005|3005|4005|1006|2006|3006|4006|1007|3007|2008|4008|1009|2009,1001|2001|3001|4001|5001|1002|2002|3002|4002|5002|1003|2003|3003|4003|5003|1004|2004|3004|4004|5004|1005|2005|3005|4005|5005|1006|2006|3006|4006|5006|1007|3007|5007|2008|4008|5008|1009|2009|3009|4009|3010,1001|2001|3001|4001|5001|1002|2002|3002|4002|5002|1003|2003|3003|4003|5003|1004|2004|3004|4004|5004|1005|2005|3005|4005|5005|1006|2006|3006|4006|5006|1007|3007|5007|2008|4008|5008|1009|2009|3009|4009|3010", },
	id_21 = {21, "神秘空岛21层", 1, 10, "0|0", "2", "60000|10000|10000,20000|20000|20000,10000|30000|30000", "1|180|1,2|216|3,3|291|5", "1|300|390,2|80|120,3|40|50", "11|2100,14|2100,15|2100,12|2100,13|2100", "11|3100,14|3100,16|3100,12|3100,13|3100", "11|3700,14|3700,15|3700,12|3700,13|3700", 0, "zhuoretudi.jpg", nil, nil, nil, nil, },
	id_22 = {22, "神秘空岛22层", 2, 10, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "1,1,1,1", "1,1", "1|10,3|20,5|40,7|80,8|120", nil, },
	id_23 = {23, "神秘空岛23层", 1, 10, "0|0", "1", "60000|10000|10000,20000|20000|20000,10000|30000|30000", "1|188|1,2|225|3,3|303|5", "1|200|260,2|40|60,3|30|38", "11|2300,14|2300,15|2300,12|2300,13|2300", "11|3400,14|3400,16|3400,12|3400,13|3400", "11|4000,14|4000,15|4000,12|4000,13|4000", 0, "zhuoretudi.jpg", nil, nil, nil, nil, },
	id_24 = {24, "神秘空岛24层", 3, 10, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "1001|2001|3001|4001|1002|2002|3002|4002|1003|2003|3003|4003|1004|2004|3004|4004|1005|2005|3005|4005|1006|2006|3006|4006|1007|3007|2008|4008|1009|2009,1001|2001|3001|4001|5001|1002|2002|3002|4002|5002|1003|2003|3003|4003|5003|1004|2004|3004|4004|5004|1005|2005|3005|4005|5005|1006|2006|3006|4006|5006|1007|3007|5007|2008|4008|5008|1009|2009|3009|4009|3010,1001|2001|3001|4001|5001|1002|2002|3002|4002|5002|1003|2003|3003|4003|5003|1004|2004|3004|4004|5004|1005|2005|3005|4005|5005|1006|2006|3006|4006|5006|1007|3007|5007|2008|4008|5008|1009|2009|3009|4009|3010", },
	id_25 = {25, "神秘空岛25层", 1, 10, "0|0", "2", "60000|10000|10000,20000|20000|20000,10000|30000|30000", "1|196|1,2|235|3,3|317|5", "1|100|130,2|25|38,3|18|23", "11|2500,14|2500,15|2500,12|2500,13|2500", "11|3700,14|3700,16|3700,12|3700,13|3700", "11|4300,14|4300,15|4300,12|4300,13|4300", 0, "zhuoretudi.jpg", nil, nil, nil, nil, },
	id_26 = {26, "神秘空岛26层", 2, 10, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "1,1,1,1", "1,1", "1|10,3|20,5|40,7|80,8|120", nil, },
	id_27 = {27, "神秘空岛27层", 1, 10, "0|0", "1", "60000|10000|10000,20000|20000|20000,10000|30000|30000", "1|204|1,2|244|3,3|329|5", "1|65|85,2|15|23,3|10|13", "11|2700,14|2700,15|2700,12|2700,13|2700", "11|4000,14|4000,16|4000,12|4000,13|4000", "11|4600,14|4600,15|4600,12|4600,13|4600", 0, "zhuoretudi.jpg", nil, nil, nil, nil, },
	id_28 = {28, "神秘空岛28层", 3, 10, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "1001|2001|3001|4001|1002|2002|3002|4002|1003|2003|3003|4003|1004|2004|3004|4004|1005|2005|3005|4005|1006|2006|3006|4006|1007|3007|2008|4008|1009|2009,1001|2001|3001|4001|5001|1002|2002|3002|4002|5002|1003|2003|3003|4003|5003|1004|2004|3004|4004|5004|1005|2005|3005|4005|5005|1006|2006|3006|4006|5006|1007|3007|5007|2008|4008|5008|1009|2009|3009|4009|3010,1001|2001|3001|4001|5001|1002|2002|3002|4002|5002|1003|2003|3003|4003|5003|1004|2004|3004|4004|5004|1005|2005|3005|4005|5005|1006|2006|3006|4006|5006|1007|3007|5007|2008|4008|5008|1009|2009|3009|4009|3010", },
	id_29 = {29, "神秘空岛29层", 1, 10, "0|0", "2", "60000|10000|10000,20000|20000|20000,10000|30000|30000", "1|212|1,2|254|3,3|342|5", "1|40|52,2|10|15,3|1|8", "11|2900,14|2900,15|2900,12|2900,13|2900", "11|4300,14|4300,16|4300,12|4300,13|4300", "11|4900,14|4900,15|4900,12|4900,13|4900", 0, "zhuoretudi.jpg", nil, nil, nil, nil, },
	id_30 = {30, "神秘空岛30层", 2, 10, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "1,1,1,1", "1,1", "1|10,3|20,5|40,7|80,8|120", nil, },
	id_31 = {31, "神秘空岛31层", 4, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, },
}

local mt = {}
mt.__index = function (table, key)
	for i = 1, #keys do
		if (keys[i] == key) then
			return table[i]
		end
	end
end

function getDataById(key_id)
	local id_data = Sky_piea_floor["id_" .. key_id]
	assert(id_data, "Sky_piea_floor not found " ..  key_id)
	if id_data == nil then
		return nil
	end
	if getmetatable(id_data) ~= nil then
		return id_data
	end
	setmetatable(id_data, mt)

	return id_data
end

function getArrDataByField(fieldName, fieldValue)
	local arrData = {}
	local fieldNo = 1
	for i=1, #keys do
		if keys[i] == fieldName then
			fieldNo = i
			break
		end
	end
	for k, v in pairs(Sky_piea_floor) do
		if v[fieldNo] == fieldValue then
			setmetatable (v, mt)
			arrData[#arrData+1] = v
		end
	end

	return arrData
end

function release()
	_G["DB_Sky_piea_floor"] = nil
	package.loaded["DB_Sky_piea_floor"] = nil
	package.loaded["db/DB_Sky_piea_floor"] = nil
end
