App.factory 'Card', ['$resource', ($resource) ->
  $resource '/cards/:id', id: '@id'
]