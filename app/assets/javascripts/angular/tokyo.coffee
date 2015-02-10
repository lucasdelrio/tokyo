# Third Party
#= require angular
#= require angular-resource
#= require angular-animate
#= require localforage

# Tokyo (Core)
#= require_self
#= require_tree ./controllers
#= require_tree ./services

angular.module 'controllers', []
angular.module 'directives',  []
angular.module 'filters',     []
angular.module 'services',    []

angular.module 'Tokyo', ['ngResource', 'ngAnimate', 'controllers', 'directives', 'filters', 'services']
