-- Constants Module
-- Game-specific constants and data

local Constants = {
    Islands = {
        ["First Sea"] = {
            "Jungle",
            "Pirate Village",
            "Desert",
            "Snow Island",
            "Marine Starter",
            "Middle Town",
            "Fountain City"
        },
        ["Second Sea"] = {
            "Kingdom of Rose",
            "Cafe",
            "Sky Island",
            "Flamingo Mansion",
            "Frozen Village"
        },
        ["Third Sea"] = {
            "Port Town",
            "Hydra Island",
            "Great Tree",
            "Castle on the Sea"
        },
        ["Fourth Sea"] = {
            "Mystic Island",
            "Dragon's Lair",
            "Celestial Peak"
        }
    },
    
    NPCs = {
        -- First Sea NPCs
        ["First Sea"] = {
            ["Bandit Leader"] = Vector3.new(100, 20, 50),
            -- More NPC positions...
        },
        -- Other seas...
    },
    
    Bosses = {
        -- Boss data...
    },
    
    Weapons = {
        -- Weapon tier lists...
    },
    
    Fruits = {
        -- Fruit data...
    }
}

return Constants
