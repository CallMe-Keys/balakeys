SMODS.Joker{ --placeholder
    key = "placeholder",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'placeholder',
        ['text'] = {
            [1] = '{C:attention}+1{} selection limit'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(1)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-1)
    end
}