SMODS.Voucher {
    key = 'tarot_dealer',
    pos = { x = 1, y = 0 },
    config = { extra = {items_prices = 1}},
    loc_txt = {
        name = 'Tarot Dealer',
        text = {
        [1] = 'A {C:blue}custom{} voucher with {C:red}unique{} effects.'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_tarot_merchant,v_tarot_tycoon'},
    atlas = 'vouchers',
    
}