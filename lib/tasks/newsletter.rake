namespace :zanzaneet do

  desc 'Sends a newsletter with all the news from the last month'
  task :send_newsletter => :environment do
    NewsletterManager.new.create_and_send
  end

end
