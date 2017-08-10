# TWEEPS

## Dependencies:
* Docker 17.06.0-ce +
* rspec-rails
* No database used
## Run instructions:
* Open the root folder
* Run the following commands in terminal:
```
$ docker build --tag tweeps .
$ docker run -p 3000:3000 tweeps
```
* Open the following URLs in your browser:
    * http://localhost:3000/most_relevants
    * http://localhost:3000/most_mentions
## Test instructions:
* Open the root folder
* Run the following command in terminal:
```
$ gem install rspec-rails
$ rspec
```
