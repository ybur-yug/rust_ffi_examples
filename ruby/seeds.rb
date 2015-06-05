require 'csv'
require_relative 'embed'

module CsvGen
  class Generator
    include Hello

    def initialize(csv_fn)
      create_stats
    end

    private

    def process_stats
      Hello.process
    end
    
    def make_user_stats
      [Random.new.random(10_000), Random.new.random(1_000), Random.new.random(1_000_000)]
    end

    def create_stats(fn)
      CSV.open(fn, "wb") do |csv|
        csv << ["weekly_gross_sales", "units_moved", "website_hits"] 
        1_000_000.times do { csv << make_user_stats }
      end
    end
  end
end

