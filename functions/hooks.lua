--plz get this working for reroll integer "current_round.reroll_cost" or "reroll_cost" is wrong
local calculate_reroll_cost = base_reroll_cost
base_reroll_cost = function(self, info_queue, card)
    print("PRE reroll!")
    local ret = calculate_reroll_cost(self, info_queue, card)
    print("POST reroll!")
    return ret
end
