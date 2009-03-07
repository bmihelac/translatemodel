require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/cases/topic'

describe TranslateModel do

  before :each do
    I18n.default_locale = 'en-US'
    @topic = Topic.new(
      :title => "title en",
      :title_hr => "title hr"
    )
  end

  it "should return locale suffix" do
    Topic.locale_suffix.should == ''
    Topic.locale_suffix('hr').should == '_hr'
    Topic.locale_suffix('hr-HR').should == '_hr'
  end
  
  it "should return untranslated title for default language" do
    @topic.title.should == "title en"
  end
  
  it "should return translated title for locale" do
    I18n.locale = 'hr-HR'
    @topic.title.should == "title hr"
  end
  
  it "should fallback to default language if column name for specified language does not exists" do
    I18n.locale = 'de-DE'
    @topic.title.should == "title en"
  end
  
  it "should fallback to default language if translation is nil" do
    I18n.locale = 'si-SI'
    @topic.title.should == "title en"
  end

end
