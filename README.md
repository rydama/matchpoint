# Matchpoint

## Anyone can host a tennis tournament

Matchpoint is a new project I started in Feb 2017. It's a work in progress. Here's a list of
the high level features for the first, very simple, version. Checked features are tested and demoable
in the dev environment (Matchpoint isn't deployed for production yet).

Check out the demo videos [here](demo_videos/README.md)

- [x] User management (with [Clearance](https://github.com/thoughtbot/clearance))
- [x] Sign in/out
- [x] Bootstrap theme
- [x] Welcome page
- [x] Home page
- [x] Tournament creation
- [x] Player registration
- [ ] Tournament matches page
- [ ] Entering match results
- [ ] Tournament leaderboard

## Local Development

- You'll need at least Ruby 2.2.3
- Matchpoint is built with Rails 5.0.1
- `git clone git@github.com:rydama/matchpoint.git matchpoint`
- `bundle install`
-  If you want to seed some sample data, `bin/rails db:seed`
- `bin/rails s`
- Visit http://localhost:3000
