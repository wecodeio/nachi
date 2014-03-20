require "csv"
require "logger"

require_relative "nachi/version"
require_relative "nachi/scraper"

module Nachi
  class Runner
    MAX_CONCURRENCY = 25

    attr_accessor :max_concurrency

    def initialize
      @logger = Logger.new(STDOUT)
      yield(self)
    end

    def execute(lines)
      queue, result = Thread::Queue.new, Thread::Queue.new
      lines.each { |part_number| queue << part_number }

      threads = (1..[lines.size, max_concurrency].min).map do |i|
        Thread.new(i) do |i|
          part_number = begin
                          queue.pop(true)
                        rescue ThreadError; end
          while part_number
            @logger.debug "[Thread ##{i}] - part number: #{part_number}"

            mass = Scraper.mass_of(part_number)
            result << [part_number, mass]

            part_number = begin
                            queue.pop(true)
                          rescue ThreadError; end
          end
        end
      end
      threads.each(&:join)

      CSV.generate do |csv|
        csv << ["Part Number", "Mass"]
        csv << []

        result.size.times do
          csv << result.pop
        end
      end
    end
  end
end
