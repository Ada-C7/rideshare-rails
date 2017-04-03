# Importing CSV Files

## Fully Manual Method
https://pastebin.com/GekBiCYP

## Automating with Rake Files
*Best Answer* https://stackoverflow.com/questions/12028334/having-trouble-seeding-csv-file-into-rails-app

``` ruby  
require 'csv'

namespace :csv do

  desc "Import CSV Data"
  task :import_stuff => :environment do

    csv_file_path = 'db/data.csv'

    CSV.foreach(csv_file_path) do |row|
      Model.create!({
        :column1 => row[0],
        :column2 => row[1],
        :column3 => row[2],        
      })
      puts "Row added!"
    end
  end
end
```
Put this in your lib/tasks folder with a .rake extension and to run it type: "rake csv:import_stuff"

Also, you might be reaching some limitations with SQL lite... I would suggest checking out MongoDB. It seems like it would be fitting for your current situation. Good luck!

### Understanding Rake
http://culttt.com/2015/08/05/understanding-and-using-ruby-rake/
http://www.stuartellis.name/articles/rake/
