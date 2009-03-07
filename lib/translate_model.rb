# TranslateModel
module TranslateModel
  
  module ClassMethods
    
    def translate(*columns)
      columns.each do |column|
        define_method "#{column}" do
          read_attribute(self.class.translated_column_name(column, I18n.locale)) || read_attribute(self.class.translated_column_name(column, I18n.default_locale))
        end
      end
    end
      
    def locale_suffix(locale = I18n.locale)
      (locale == I18n.default_locale) ? "" : "_" + locale.to_s.split('-').first
    end
    
    def translated_column_name(column, locale)
      column.to_s + locale_suffix(locale)      
    end
    
  end
end