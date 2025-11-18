local mod = SMODS.current_mod
config = SMODS.current_mod.config
keys_enabled = copy_table(config)                                                  --change "keys" to your choice eg. "blank_enabled"

local function config_matching()
	for k, v in pairs(keys_enabled) do                                             --make sure this variable is the same as line 3
		if v ~= config[k] then
			return false
		end
	end
	return true
end

--allows game to restart automatically
function G.FUNCS.keys_restart()                                                                           --change "keys" to your choice eg. "blank_restart"
	if config_matching() then
		SMODS.full_restart = 0
	else
		SMODS.full_restart = 1
	end
end

--config tab
SMODS.current_mod.config_tab = function()
  keys_nodes = {{n=G.UIT.R, config={align = "cm"}, nodes={                                                                              --change "keys" to your choice eg. "blank_nodes"
    {n=G.UIT.O, config={object = DynaText({string = "Options:", colours = {G.C.WHITE}, shadow = true, scale = 0.4})}},
  }},create_toggle({label = "Custom Title Screen (Requires Restart)", ref_table = config, ref_value = "title", callback = G.FUNCS.keys_restart,   --make sure this variable is the same as line 14
})
}
  return {
    n = G.UIT.ROOT,
    config = {
        emboss = 0.05,
        minh = 6,
        r = 0.1,
        minw = 10,
        align = "cm",
        padding = 0.2,
        colour = G.C.BLACK
    },
    nodes = keys_nodes                                                                                                        --make sure this variable is the same as line 34
  }  
end

--title screen
if config.title then            
  SMODS.Atlas({
    key = "balatro",
    path = "balatro.png",                                                                                                    --make sure this is the name of your title screen png in assets folder, if not change the file name to this
    px = 333,
    py = 216,
    prefix_config = { key = false }
  })

  function add_card_to_title(use_key)
    local newcard = SMODS.create_card({
        set = "Joker",
        area = G.title_top,
        key = use_key,
        no_edition = true
    })
    -- recenter the title
    newcard:start_materialize({ G.C.WHITE, G.C.SECONDARY_SET.Personality }, true, 2.5)
    G.title_top:emplace(newcard)
    -- make the card look the same way as the title screen Ace of Spades
    newcard.T.scale = 1.32
  newcard.no_ui = true
end 

--defining colors for bg
G.C.keyscolor = HEX("7734eb")                                                   --change "keyscolor" to custom name, replace "7734eb" with your own hex code for your own color. copy the line and paste underneath it for more colors.

local main_menu_ref = Game.main_menu
Game.main_menu = function(self, change_context)
    local ret = main_menu_ref(self, change_context)
    add_card_to_title("j_oops")                                                                                       --replace j_oops with the joker or card of choice, for some reason consumables have weird purple shit, not sure why yet
    G.title_top.T.w = G.title_top.T.w + 1.35
    G.title_top.T.x = G.title_top.T.x - 0.7
    G.SPLASH_BACK:define_draw_steps({ {
        shader = 'splash',
        send = {
            { name = 'time',       ref_table = G.TIMERS, ref_value = 'REAL_SHADER' },
            { name = 'vort_speed', val = 0.4 },
            { name = 'colour_1',   ref_table = G.C,      ref_value = 'keyscolor' },                          --"RED" and "BLUE" are the colors of the background, you can replace either with another color eg. WHITE - OR replace with the custom name from line 72
            { name = 'colour_2',   ref_table = G.C,      ref_value = 'CLEAR' },
        }
    } }) 
    return ret
end
end

SMODS.Atlas({
    key = "modicon", 
    path = "modicon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = true },
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "jokers", 
    path = "jokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "vouchers", 
    path = "vouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "taxation", 
    path = "taxation.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local files = {
    "content/jokers/aigeneratedhand",
    "content/jokers/monke",
    "content/jokers/oopsididitagain",
    "content/jokers/retrigger",
    "content/jokers/savinggrace",
    "content/jokers/thedevil",
    "content/jokers/trickster",
    "content/decks/taxation",
    "content/vouchers/money",
    "content/vouchers/tarot_dealer",
    "functions/hooks",
}
for i, v in pairs(files) do
	assert(SMODS.load_file(v..".lua"))()
end

SMODS.ObjectType({
    key = "balakeys_jokers",
    cards = {
        ["j_balakeys_aigeneratedhandwip"] = true,
        ["j_balakeys_oopsididitagain"] = true,
        ["j_balakeys_savinggrace"] = true,
        ["j_balakeys_thedevil"] = true,
        ["j_balakeys_monke"] = true,
        ["j_balakeys_retrigger"] = true,
        ["j_balakeys_tricksterwip"] = true
    },
})