module Docs
  class FhAndroid
    class EntriesFilter < Docs::EntriesFilter
      
      def get_name
        slug.gsub(/(\w+\/)+/, "")
      end
      
      # Add constant values
      # packages without prefix
      def get_type
        slug.gsub(/((?:\w+\/)+).*/, "\\1").chomp("/").gsub("/", ".")
      end
      
      # add additional entries for methods
      def additional_entries
        result = []
        # doc.xpath("//table[tbody/tr/th/font/b[text()='Method Summary']]/tbody/tr[position()>1]").each do |row|
        doc.xpath("//table[position()>1]//tbody").each do |row|
          static = row.xpath("//td[1]").text.include?("static")
          methName = row.xpath("//td[2]/code/b/a").text
          type = slug.gsub(/((?:\w+\/)+).*/, "\\1").chomp("/").gsub("/", ".")
          
          puts static
          puts methName
          puts type
        end
        
        result
      end
      
    end
  end
end
