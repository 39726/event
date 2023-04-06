# basic event system with metatables

# how to use

```lua
local test = event:newEvent("Test", 10, function(e, val) 
    print(("%s value changed to: %s"):format(e.Name, val))
end)

task.wait(2)

test.Value = 20             -- will fire the function

task.wait(2)

test.Value = 30             -- will fire the function
```
