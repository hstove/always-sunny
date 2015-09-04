The repo behind [sunny.hankstoever.com](http://sunny.hankstoever.com)

# Installation

If you have ruby installed, setup should be easy.

~~~bash
git clone git@github.com:hstove/always-sunny.git
cd always-sunny
bundle install -j4
bin/rake db:create
bin/rake db:reset
bundle exec guard
~~~

The last command (`guard`) will start up tests and your local server. Visit
http://localhost:3000, and it should work!

# Manipulating the chart

If you want to edit the chart, you'll have to add some data. Go to http://localhost:3000/admin
and use 'admin' and 'password' as the login. Then, go the [episodes collection](http://localhost:3000/admin/episode)
and start manually inputing the `starts_at` field for each episode. Don't worry about the
actual date here, just make sure the weekday and time are correct in the datepicker.

After inputting data, refresh the homepage and you should see some bubbles in the chart.

# Contributing

All contributions are appreciated! If you're not sure about something, feel free
to [open an issue](https://github.com/hstove/always-sunny/issues/new).
