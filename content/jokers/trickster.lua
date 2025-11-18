SMODS.Joker{ --Trickster WIP
    key = "trickster",
    config = {extra = {destroyed = 0, standard = 0}},
    pos = {x = 6, y = 0},
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pools = { ["balakeys_jokers"] = true },

    calculate = function(self, card, context)
        if context.remove_playing_cards  and not context.blueprint then
            if G.GAME.used_vouchers["v_illusion"] then
                return {func = function()
            G.E_MANAGER:add_event(Event({func = function()
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