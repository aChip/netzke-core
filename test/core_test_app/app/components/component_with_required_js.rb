class ComponentWithRequiredJs < Netzke::Base
  class_attribute :title
  self.title = "My title"

  js_configure do |c|
    c.require "#{File.dirname(__FILE__)}/included.js"
    c.extend = "Netzke.ComponentWithRequiredJs" # defined in required file
    c.on_print_message = <<-JS
      function(){
        this.updateBodyWithMessage("Some message " + "shown in the body");
      }
    JS

    c.active_tab = 0
    c.title = title
  end

  action :print_message

  def configure(c)
    super
    c.bbar = [:print_message]
  end
end
