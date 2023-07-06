# ab_solar_panel ESX Legacy
Solar Panel in item 

```version '1.0.0'```


# Requirements
ox_lib
ox_inventory
ox_target


# installation

1>
ox_inventory\data\items
```lua
	['solar_panel'] = {
		label = 'Solar Panel',
		weight = 10,
		stack = true,
		close = true,
		description = nil,
		consume = 1,
		client = {
			event = 'spawnObject'
		},
	},
```

2>
put ab_solar_panel files to resources

3>
put ```ensure ab_solar_panel``` in server.cfg

 4>
 start server

# License
 it's free
 
 It would be nice if you tell who made this project <3
 
 
