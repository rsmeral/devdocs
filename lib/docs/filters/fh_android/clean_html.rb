module Docs
  class FhAndroid
    class CleanHtmlFilter < Filter
      
      def call
        
        # Remove top navbar
        css("a[href='#skip-navbar_top'] + table").remove
        css("a[name='skip-navbar_top'] + hr").remove
        css("div hr").remove
        
        # Remove bottom navbar
        css("a[href='#skip-navbar_bottom'] + table").remove
        
        # remove non-semantic tags
        # css("b").each do |b|
        #   b.replace(b.text)
        # end
        # 
        # css("font").each do |font|
        #   font.replace(font.children)
        # end
        
        # Make field headers linkable
        # Switch the link target to be a h3[id] instead of a[name] and remove the empty anchor
        css("a[name] + h3").each do |elem|
          a = elem.previous
          elem["id"] = a["name"]
          a.remove
        end
        
        doc
      end
      
    end
  end
end
