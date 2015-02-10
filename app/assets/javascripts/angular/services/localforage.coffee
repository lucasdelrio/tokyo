angular.module('services')

  .factory 'Localforage', () ->
    debugger
    localforage.config({
        driver      : localforage.LOCALSTORAGE, # Force WebSQL; same as using setDriver()
        name        : 'Tokyo',
        version     : 1.0,
        storeName   : 'keyvaluepairs',          # Should be alphanumeric, with underscores.
        description : 'Tokyo App'
    });

    localforage
