(function (angular) {
    angular.module('digiAssure')
.factory('APIInterceptor', ['$q',
    function ($q) {

        return {
            request: request,
            response: response,
            responseError: responseError
        };

        function request(config) {
            //check for api call
        	console.log('config', config.url);
           /* if (utils.startsWith(config.url, globalConstants.webServiceBase)) {
                
                config.headers['X-CSRF-Token'] = userSession.getToken();
            	config.headers['X-CSRF-Token'] = 1234;
                config.withCredentials = true;
            }*/

            return config;
        };

        function response(response) {		
            return response;
        }

        function responseError(response) {
            console.log("error: ", response);
            //errorResponseHandler.handle(response);
            return $q.reject(response);
        };
    }])
})(angular);
