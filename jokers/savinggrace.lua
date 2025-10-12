SMODS.Joker{ --Saving Grace
    key = "savinggrace",
    config = {
        extra = {
            no = 0,
            var1 = 0,
            explode = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'Saving Grace',
        ['text'] = {
            [1] = 'When {C:attention}Game Over{}, this Joker destroys itself',
            [2] = 'and a random joker, {C:attention}preventing loss{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["balakeys_balakeys_jokers"] = true },

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  and not context.blueprint then
                return {
                    func = function()
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                    return true
                end,
                    extra = {
                        saved = true,
                            message = localize('k_saved_ex'),
                        colour = G.C.RED,
                        extra = {
                            func = function()
                card:explode()
                return true
            end,
                            message = "Saved!",
                            colour = G.C.RED
                        }
                        }
                }
        end
    end
}