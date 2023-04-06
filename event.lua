local event = {events={}}

function event:newEvent(Name, Value, OnChange) 
    if not Name and not OnChange then
        return
    end    
    
    local object = {
        Name = Name,
        Value = Value
    }
    
    local prox = newproxy(true)
    local meta = getmetatable(prox)
    setmetatable(meta, {
        __index = object,
        __newindex = function(_, key, value) 
            if key == "Value" then
                pcall(OnChange, object.Name, value)
            end    
            object[key] = value
        end
    })
    table.insert(event.events, meta)
    return meta
end

return event
