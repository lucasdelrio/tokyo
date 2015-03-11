# User model
#
# It will serve as the main storage for all user interactions:
#   - adding new expenses
#   - adding new groups
class User

  constructor: (@id, @expenses = [], @groups = []) ->

  addExpense: (expense) ->
    @expenses.push expense

window.Tokyo.Core.User = User
