App.controller 'CardsCtrl', ['$scope', 'Card', ($scope, Card) ->
  $scope.selectedCard = null
  $scope.selectedRow  = null

  $scope.cards = Card.query ->
    $scope.selectedCard = null
    $scope.selectedRow = null


  $scope.showCard = (card, row) ->
    $scope.selectedCard = card
    $scope.selectedRow = row
]