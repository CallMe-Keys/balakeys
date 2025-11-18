SMODS.Back{
    key = "taxdeck",
    atlas = 'taxation',
    pos = {x = 0, y = 0},
    unlocked = true,
    no_collection = false,
    discovered = true, 
    config={vouchers={'v_overstock_norm','v_overstock_plus'},
    },
    loc_vars = function(self, info_queue, card)
        return{ vars = {}}
    end,
    calculate = function(self, back, context)
        if context.reroll_shop then
            G.GAME.current_round.reroll_cost = G.GAME.current_round.reroll_cost + 2
            return {}
        end
    end
}