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
        doc.xpath("//table[.//b[text()='Method Summary']]/tr[position()>1]").each do |row|
          
          static = row.xpath(".//td[1]").text.include?("static")
          methName = row.xpath(".//td[2]/code/b/a").text
          methHash = row.xpath(".//td[2]/code/b/a/@href").text.strip.gsub(/.*\#/, "")
          
          type = slug.gsub(/((?:\w+\/)+).*/, "\\1").chomp("/").gsub("/", ".")
          
          result.push([slug.gsub(/(\w+\/)+/, "") + (static ? "#" : ".") + methName, methHash])
        end
        
        result
      end
      
    end
  end
end
