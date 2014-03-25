# Push to Production and run database scripts
git push production

# Migrate database
heroku run --app 'floating-eyrie-9121' rake db:migrate

# Migrate seed
heroku run --app 'floating-eyrie-9121' rake db:seed

# Rails console, generate slugs for quotes
heroku run --app 'floating-eyrie-9121' rails c load 'generate_quote_slug.rb'

# Rails console, add tags
heroku run --app 'floating-eyrie-9121' rails c load 'generate_tags.rb'