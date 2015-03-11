angular.module('services')

  .factory 'Localforage', () -> # TODO provide config
    localforage.config({
        driver      : localforage.LOCALSTORAGE, # Force WebSQL; same as using setDriver()
        name        : 'tokyo',
        version     : 1.0,
        storeName   : 'tokyo_dev',              # Should be alphanumeric, with underscores.
        description : 'Tokyo App'
    });

    localforage
