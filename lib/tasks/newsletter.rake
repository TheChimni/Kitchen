namespace :zanzaneet do

  desc 'Sends a newsletter with all the news from the last month'
  task :send_newsletter => :environment do
    puts "Sending newsletter to all subscribers..."
    NewsletterManager.new.create_and_send
  end

  desc 'Sends a test newsletter to the email address specified on the command line or info@zanzaneet.com by default'
  task :test_newsletter => :environment do
    puts "Sending test newsletter to #{ARGV[1] || 'info@zanzaneet.com'}"
    NewsletterManager.new.create_and_send_test(ARGV[1] || 'info@zanzaneet.com')
  end

  desc 'Creates a preview newsletter and prints it to the console using the email address specified on the command line or info@zanzaneet.com by default'
  task :preview_newsletter => :environment do
    puts "Printing test newsletter for #{ARGV[1] || 'info@zanzaneet.com'}"
    puts NewsletterManager.new.create_and_preview(ARGV[1] || 'info@zanzaneet.com')
  end

end
