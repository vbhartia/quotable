# Push to Production and run database scripts
git push staging

# Migrate database
heroku run --app 'tranquil-coast-7935' rake db:migrate

# Migrate seed
heroku run --app 'tranquil-coast-7935' rake db:seed

# Rails console, generate slugs for quotes
heroku run --app 'tranquil-coast-7935' rails c load 'generate_quote_slug.rb'

# Rails console, add tags
heroku run --app 'tranquil-coast-7935' rails c load 'generate_tags.rb'