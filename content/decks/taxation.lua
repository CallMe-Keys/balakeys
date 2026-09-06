SMODS.Back{
    key = "taxdeck",
    atlas = 'taxation',
    pos = {x = 0, y = 0},
    unlocked = true,
    no_collection = false,
    discovered = true, 
    config = { reroll_cost_increase = 3, vouchers = {'v_overstock_norm','v_overstock_plus'} },

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.reroll_cost_increase } }
    end,

    apply = function(self)
        -- stores the desired scaling rate (3) on the game modifiers table
        G.GAME.modifiers.tax_reroll_scaling = self.config.reroll_cost_increase
    end
}