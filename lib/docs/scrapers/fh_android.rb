module Docs
  class FhAndroid < FileScraper
    self.name = "FeedHenry Android SDK"
    self.slug = "fh_android"
    self.type = 'fh_android'
    self.release = '3.1.0' # FIX
    self.dir = '/home/rsmeral/projects/fh/feedhenry/fh-android-sdk/sdk/doc'
    self.root_path = 'index-all.html'
    
    html_filters.push 'fh_android/entries', 'fh_android/clean_html'

    # Only process classes, skip all else
    options[:skip_patterns] = [
      /allclasses-frame.html/,
      /allclasses-noframe.html/,
      /deprecated-list.html/,
      /help-doc.html/,
      /index.html/,
      /overview-frame.html/,
      /overview-summary.html/,
      /overview-tree.html/,
      /serialized-form.html/,
      /constant-values.html/,
      /package-frame.html/,
      /package-summary.html/,
      /package-tree.html/
    ]

    options[:attribution] = <<-HTML
      Copyright 2016 Red Hat Inc.<br>
      Licensed under the Apache License, Version 2.0
    HTML

  end
end
