# Practice with Delayed Emails & Uploading Photos
========================
gem Letter Opener
gem Paperclip
gem Figaro
Amazon S3 account

In this brief assignment I created environment variables with Figaro and set up the Paperclip gem to work with my Amazon S3 account. Then, using Letter  Opener gem created email templates and sending users a welcome emails (and notification about updates) asynchronously.


## Getting Started

To get the app started locally you'll need to:

1. Clone the repo with `git clone REPO_URL`
2. `cd` into the project
3. Run
  - `$ bundle install`
  - `$ bundle exec rake db:migrate`
  - `$ bundle exec rake db:seed`
(# take a look around the schema file to see how models were created)

1. Start up the server with `rails s` command and visit `http://localhost:3000` in your browser


## About the author
[Dariusz Biskupski](http://dariuszbiskupski.com/)

## Acknowledgments

This is an assignment created for [Viking Code School](https://www.vikingcodeschool.com/)
