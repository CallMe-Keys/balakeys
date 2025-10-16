SMODS.Joker{ --retrigger
    key = "retrigger",
    config = {
        extra = {
            retriggers = 0,
            handsplayedthisround = 0,
            scale = 1,
            rotation = 1,
            onetime = 0
        }
    },
    loc_txt = {
        ['name'] = 'retrigger',
        ['text'] = {
            [1] = 'When {C:attention}Boss Blind{} is defeated in {C:common}1{} hand,',
            [2] = 'add {C:attention}1{} retrigger to all scored {C:attention}odd cards{}',
            [3] = '{C:inactive}(Currently{} {C:attention}+#1#{}{C:inactive} Retriggers){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["balakeys_myshi_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.retriggers}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
            if G.GAME.current_round.hands_played == 1 then
                local target_card = context.other_card
                return {
                    message = "+1",
                    extra = {
                        func = function()
                      card:juice_up(card.ability.extra.scale, card.ability.extra.rotation)
                      return true
                    end,
                        colour = G.C.WHITE,
                        extra = {
                            func = function()
                    card.ability.extra.retriggers = (card.ability.extra.retriggers) + 1
                    return true
                end,
                            colour = G.C.GREEN
                        }
                        }
                }
            end
        end
        if context.repetition and context.cardarea == G.play  then
            if ((context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9) and card.ability.extra.retriggers > 0) then
                return {
                    repetitions = card.ability.extra.retriggers,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}