SMODS.Joker{ --The Devil
    key = "thedevil",
    config = {
        extra = {
            infinite = 10000
        }
    },
    loc_txt = {
        ['name'] = 'The Devil',
        ['text'] = {
            [1] = 'free rerolls but when you reroll you add a playing card with random everything'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["balakeys_balakeys_jokers"] = true },

    calculate = function(self, card, context)
        if context.reroll_shop  then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
            local new_card = create_playing_card({
                front = card_front,
                center = 
      pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_enhancement'))
            }, G.discard, true, false, nil, true)
      new_card:set_seal(pseudorandom_element({'Gold','Red','Blue','Purple'}, pseudoseed('add_card_seal')), true)
      new_card:set_edition(pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, pseudoseed('add_card_edition')), true)
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    new_card:start_materialize()
                    G.play:emplace(new_card)
                    return true
                end
            }))
                return {
                    func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up')
                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
            end,
                    message = "Added Card!"
                }
        end
        if context.playing_card_added  then
                return {
                    func = function()
                    card.ability.extra.infinite = 10000
                    return true
                end
                }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(card.ability.extra.infinite)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(-(card.ability.extra.infinite))
    end
}