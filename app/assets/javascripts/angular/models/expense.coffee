class Expense

  constructor: (@title, @amount, @date, @extraData = {}) ->

  @collection: (items) ->
    s = (new Expense(item.title, item.amount, item.date, item.extraData || []) for item in items)

window.Tokyo.Core.Expense = Expense
