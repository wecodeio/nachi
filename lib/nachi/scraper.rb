require "capybara"
require "capybara/webkit"

Capybara.match = :first

module Nachi
  class Scraper

    def self.mass_of(part_number)
      session = Capybara::Session.new(:webkit)
      # session = Capybara::Session.new(:selenium)
      session.visit("http://nachi-tool.jp/bearing/")
      session.within('form[name="frmSearch"]') do
        session.fill_in("search_keywords", with: part_number)
      end
      session.execute_script("document.frmSearch.submit()")

      begin
        session.click_link(part_number)
      rescue Capybara::ElementNotFound
        return
      end

      html = session.html
      # session.driver.browser.close
      doc = Nokogiri::HTML(html)

      md = nil
      doc.css("#sdata_top_r td").map(&:text).find { |text| md = text.match(/\AMass = /) }
      md.post_match if md
    end
  end
end
