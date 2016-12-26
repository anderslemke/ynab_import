require "ynab_import/version"
require "ynab_import/converter"

require "ynab_import/csv/rewriter"
require "ynab_import/csv/nordea"
require "ynab_import/csv/epos"
require "ynab_import/csv/uc"
require "ynab_import/csv/vpass"

module YnabImport
  Dir.glob("/Users/jens/Downloads/*.csv").each do |file|
    if file.include? "poster"
      Converter.new(file, Csv::Nordea).convert!
    elsif file.include? "UC"
      Converter.new(file, Csv::Uc).convert!
    elsif file.include? "UseHistoryReference"
      Converter.new(file, Csv::Epos).convert!
    else
      Converter.new(file, Csv::Vpass).convert!
    end
  end
end
