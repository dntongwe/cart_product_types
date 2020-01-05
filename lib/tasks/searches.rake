desc "Remove searches older than a month"
task :remove_searches_older_than_1_month => :environment do 
 searches_delete_all ['created_at < ?', 1.month.ago]
end