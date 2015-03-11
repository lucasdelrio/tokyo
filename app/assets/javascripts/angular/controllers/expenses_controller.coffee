angular.module('controllers')

  .controller 'ExpensesController', ($scope, UserStorage, AppConfig) ->

    $scope.user = new Tokyo.Core.User AppConfig.userId
    UserStorage.findOrCreate AppConfig.userId, (user) -> $scope.user = user

    $scope.save = ->
      $scope.user.addExpense new Tokyo.Core.Expense $scope.expense.title, $scope.expense.price, $scope.expense.date
      UserStorage.store $scope.user

      initializeExpense()

    initializeExpense = -> $scope.expense = {} # Reset form
    initializeExpense()
