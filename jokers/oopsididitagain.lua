SMODS.Joker{ --Oops! All Oops! All 6s
    key = "oopsididitagain",
    config = {
        extra = {
            denominator = 0,
            set_probability_min = 0,
            set_probability_max = 12,
            numerator = 0
        }
    },
    loc_txt = {
        ['name'] = 'Oops! All Oops! All 6s',
        ['text'] = {
            [1] = 'randomizes all chances from 0 to 12'
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
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["balakeys_balakeys_jokers"] = true },

    calculate = function(self, card, context)
        if context.fix_probability  then
        local numerator, denominator = context.numerator, context.denominator
                numerator = pseudorandom('set_probability_1cb37c19', card.ability.extra.set_probability_min, card.ability.extra.set_probability_max)
      return {
        numerator = numerator, 
        denominator = denominator
      }
        end
    end
}
