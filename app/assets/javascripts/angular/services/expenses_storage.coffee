angular.module('services')

  .factory 'ExpensesStorage', (Localforage) ->
    buildKey   = (id) -> "local/entities/expenses/#{id}"
    generateId = (item) -> item.id = "asdzxcqwe"

    store: (item) ->
      generateId(item)
      key = buildKey(item.id)
      debugger
      localforage.setItem(key, JSON.stringify(item)).then (value) -> console.log "Stored: #{value}"
