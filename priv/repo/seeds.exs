alias PeekChallenge.Orders

for value <- 1..3,
    do:
      Orders.create_order(%{description: "This is order ##{value}", total: 100, balance_due: 100})
