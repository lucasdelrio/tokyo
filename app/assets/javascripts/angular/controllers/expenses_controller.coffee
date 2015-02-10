angular.module('controllers')

  .controller 'ExpensesController', ($scope, ExpensesStorage) ->

    # Expense entity to be persisted
    $scope.expense = {}

    #
    $scope.save = (event) ->
      event.preventDefault()
      ExpensesStorage.store $scope.expense
