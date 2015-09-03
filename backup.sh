heroku pg:backups capture DATABASE_URL
rm -r backups
mkdir backups
curl -o backups/latest.dump `heroku pg:backups public-url`
pg_restore -d always_sunny_development backups/latest.dump --verbose --clean --no-acl --no-owner -h localhost
rake db:migrate
rm -r backups
