angular.module "fakeLunchHub"
  .controller "GroupsCtrl", ($scope, Group) ->
    Group.query().then (groups) -> $scope.groups = groups
