# ReqRes API Client Package

>Disclaimer: This README was created with the assistance of GitHub Copilot.
>I will manually create the main project README.

This package provides a ```ReqResApiClient``` class that is used to interact with the ReqRes API, a free-to-use API for testing and prototyping.

The ```ReqResApiClient``` class has two main methods: ```register``` and ```getUser```.

## ReqResApiClient

The ```ReqResApiClient``` class is initialized with an optional ```RemoteClient``` object. If no ```RemoteClient``` is provided, the class uses the ```GetIt``` package to locate an instance of ```RemoteClient```.

### ```register```

The ```register``` method is used to register a new user with the ReqRes API. It takes a body parameter, which should be a ```Map<String, dynamic>``` representing the user to be registered. The method sends a ```POST``` request to the ```ApiRoutes``` register endpoint with the provided body.

The method returns a ```Future``` that resolves to a ```Response<Map<String, dynamic>?, String>```. The ```Response``` object contains the server's response to the registration request.

### ```getUser```
The ```getUser``` method is used to retrieve information about a user from the ReqRes API. It takes an optional ```userId``` parameter, which should be a ```String``` representing the ID of the user to retrieve. The method sends a ```GET``` request to the ```ApiRoutes.users``` endpoint with the provided userId.

The method returns a Future that resolves to a ```Response<Map<String, dynamic>, String>```. The ```Response``` object contains the server's response to the user retrieval request.

## Dependencies
This package depends on the ```get_it``` package for dependency injection and the ```http``` package for HTTP requests.
