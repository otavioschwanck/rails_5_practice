# README

# About
This is a quickly project that the only purpose is to train my project setup skills and capybara test. I did not cling to details like i18n, design and utility.

Time spend on this project: 5h. (Docker setup, project setup, learn capybara tests, capybara setup with selenium docker container)

# Highlights:
- Docker configuration to easy setup the project.
- Scripts to help the use of commands inside docker container
- Capybara installed with selenium as a container to run test easily without download the webdriver
- Rubocop and reek to make code more clean
- CRUD capybara test
- RSpec <3

## Project details and setup:

* Ruby version
  - 2.6

* System dependencies
  - Docker 18.09
  - Docker Compose 1.23

* Configuration
  - docker-compose up -d

* Database creation
  - ./drails.sh db:create db:migrate
  
* How to run the test suite
  - ./dbundle.sh exec rspec

* Running the application
  - ./server.sh
  - Open your browser and go to: localhost:3000
