# Matchpoint

## Anyone can host a tennis tournament

Matchpoint is a new project I've started in Feb 2017. It's a work in progress. Here's a list of
the high level features for the first, very simple, version. Checked features are tested and demoable
in the dev environment (Matchpoint isn't deployed for production yet).

- [ ] User management (with [Clearance](https://github.com/thoughtbot/clearance))
- [ ] Sign in/out
- [ ] Basic Bootstrap styling
- [ ] Welcome page
- [ ] Home page
- [x] Tournament creation
- [ ] Player registration
- [ ] Matches page
- [ ] Entering match results
- [ ] Player ranking page

## Local Development

- You'll need at least Ruby 2.2.3
- Matchpoint is built with Rails 5.0.1
- `git clone git@github.com:rydama/matchpoint.git matchpoint`
- `bundle install`
-  If you want to seed some sample data, `bin/rails db:seeds`
- `bin/rails s`
- Visit http://localhost:3000

## To clean up

- Use new hash syntax

## Not started yet

- No production environment yet. It hasn't even been started.
- No design. Just the stock Bootstrap template.
