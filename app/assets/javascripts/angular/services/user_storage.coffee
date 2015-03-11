angular.module('services')

  .factory 'UserStorage', (Localforage) ->

    buildKey = (id) -> "local/entities/users/#{id}"

    store = (item) ->
      Localforage.setItem(buildKey(item.id), item).then (user) -> console.log "User stored: #{user.id}"

    hydrate = (data) ->
      user = new Tokyo.Core.User data.id, Tokyo.Core.Expense.collection(data.expenses)

    create = (userId) ->
      user = new Tokyo.Core.User userId
      store user
      return user

    find = (userId) ->
      Localforage.getItem buildKey(userId)

    findOrCreate = (userId, callback) ->

      find(userId).then (data, error) ->
        user = null

        if not data and not error
          user = create(userId)

        if data and not error
          user = hydrate(data)
          console.log "User found: #{user.id}"

        callback(user)

    store: store
    create: create
    find: find
    findOrCreate: findOrCreate
