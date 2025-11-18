SMODS.Joker{ --monke
    key = "monke",
    config = { extra = { xchips = 1.5 }},
    pos = {x = 1, y = 0},
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    pools = { ["balakeys_jokers"] = true },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 7 and SMODS.get_enhancements(context.other_card)["m_lucky"] == true) then
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
    end
}