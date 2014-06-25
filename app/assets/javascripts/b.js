

var likeApp = angular.module('like-app', ['ngResource','angularFileUpload']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';

}]);


likeApp.factory('Product', ['$resource', function($resource) {
  return $resource('/products/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});

}]);


likeApp.controller('ProductCtrl', ['Product', '$scope', '$upload', function(Product, $scope, $upload ) {
$scope.onFileSelect = function($files) {
    //$files: an array of files selected, each file has name, size, and type.
    for (var i = 0; i < $files.length; i++) {
      var file = $files[i];
      $scope.upload = $upload.upload({
        url: '/companies/:id', //upload.php script, node.js route, or servlet url
        // method: 'POST' or 'PUT',
        // headers: {'header-key': 'header-value'},
        // withCredentials: true,
        data: {myObj: $scope.myModelObj},
        file: file, // or list of files: $files for html5 only
        /* set the file formData name ('Content-Desposition'). Default is 'file' */
        //fileFormDataName: myFile, //or a list of names for multiple files (html5).
        /* customize how data is added to formData. See #40#issuecomment-28612000 for sample code */
        //formDataAppender: function(formData, key, val){}
      }).progress(function(evt) {
        console.log('percent: ' + parseInt(100.0 * evt.loaded / evt.total));
      }).success(function(data, status, headers, config) {
        // file is uploaded successfully
        console.log(data);
      });
      //.error(...)
      //.then(success, error, progress); 
      //.xhr(function(xhr){xhr.upload.addEventListener(...)})// access and attach any event listener to XMLHttpRequest.
    }
    /* alternative way of uploading, send the file binary with the file's content-type.
       Could be used to upload files to CouchDB, imgur, etc... html5 FileReader is needed. 
       It could also be used to monitor the progress of a normal http post/put request with large data*/
    // $scope.upload = $upload.http({...})  see 88#issuecomment-31366487 for sample code.
  };


   $scope.products = [];
   $scope.newProduct = new Product();

  Product.query(function(products) {
  	
    $scope.products = products;
  });

 	  $scope.saveProduct = function(event) {
      event.preventDefault();
      $scope.newProduct.$save(function(product) {
        $scope.products.push(product)
        $scope.newProduct = new Product();
      });
    }

    $scope.deleteProduct = function(product) {
        product.$delete(function() {
        position = $scope.products.indexOf(product);
        $scope.products.splice(position, 1);
      }, function(errors) {
        $scope.errors = errors.data
      });
    }

    $scope.showProduct = function(product) {
      product.details = true;
      product.editing = false;
    }

    $scope.hideProduct = function(product) {
      product.details = false;
      product.editing = false;
      console.log('hi');
    }

    $scope.editProduct = function(product) {
      product.editing = true;
      product.details = false;
    }

    $scope.updateProduct = function(product) {
      product.$update(function() {
        product.editing = false;
      }, function(errors) {
        $scope.errors = errors.data
      });
    }

    $scope.clearErrors = function() {
      $scope.errors = null;
    }
}])


