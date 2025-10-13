SMODS.Joker{ --Trickster WIP
    key = "tricksterwip",
    config = {
        extra = {
            destroyed = 0,
            standard = 0
        }
    },
    loc_txt = {
        ['name'] = 'Trickster WIP',
        ['text'] = {
            [1] = 'When a {C:attention}Playing Card{} is destroyed while',
            [2] = '{C:dark_edition}Illusion{} voucher is owned, gain {C:attention}Standard Tag{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["balakeys_myshi_jokers"] = true },

    calculate = function(self, card, context)
        if context.remove_playing_cards  and not context.blueprint then
            if G.GAME.used_vouchers["v_illusion"] then
                return {
                    func = function()
            G.E_MANAGER:add_event(Event({
                func = function()
                    local tag = Tag("tag_standard")
                    if tag.name == "Orbital Tag" then
                        local _poker_hands = {}
                        for k, v in pairs(G.GAME.hands) do
                            if v.visible then
                                _poker_hands[#_poker_hands + 1] = k
                            end
                        end
                        tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                    end
                    tag:set_ability()
                    add_tag(tag)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
                    return true
                end,
                    message = "Created Tag!"
                }
            end
        end
    end
}