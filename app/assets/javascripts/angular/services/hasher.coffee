angular.module('services')

  .factory 'Hasher', () -> # TODO provide salt through config
    new Hashids("this is my salt")
