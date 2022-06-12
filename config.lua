Config 			= {}

-- General
Config.AutoPay = false -- If set to false, drivers will have to pay their fines like tickets issued with the police job
Config.AutoPayAccount = 'bank'
Config.EnableBlips = true

-- Fines
Config.Fine 	= 300 -- 10mph over (default: $300)
Config.Fine2 	= 400 -- 20mph over (default: $400)
Config.Fine3	= 500 -- 30mph over (default: $500)
Config.Fine4 	= 600 -- 40mph over (default: $600)


-- Radar Zones
Config.radarZones = {
	{
		Name = 'Vespucci Blvd (8177)',
        SpeedLimit = 40,
        position = vector3(379.68807983398, -1048.3527832031, 29.250692367554)
	},
    {
		Name = 'Los Santos Freeway (7284)',
        SpeedLimit = 70,
        position = vector3(722.99047851563, -125.19661712646, 52.371295928955)
	},
    {
		Name = 'Unknown',
        SpeedLimit = 40,
        position = vector3(867.81622314453,-832.78131103516,43.282249450684)
	},
    {
		Name = 'Unknown',
        SpeedLimit = 40,
        position = vector3(480.3356628418,-864.31433105469,37.262077331543)
	},
    {
		Name = 'Unknown',
        SpeedLimit = 40,
        position = vector3(319.41986083984,-814.41882324219,29.277896881104)
	},
    {
		Name = 'Unknown',
        SpeedLimit = 40,
        position = vector3(320.61996459961,-716.52734375,29.31042098999)
	},
    {
		Name = 'Unknown',
        SpeedLimit = 50,
        position = vector3(135.13459777832,1669.8150634766,228.55128479004)
	}
}