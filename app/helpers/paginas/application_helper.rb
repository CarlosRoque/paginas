module Paginas
  module ApplicationHelper
    def paginas_menu_helper_by_pages(ids,options = {})
      options[:item_style] ||= "[link]"
      options[:item_separator] ||= " | "
      options[:group_style] ||= "[items]"
      options[:active_class] ||= ""

      output = ''
      separator = ''
      ids.each do |key,id|
        output += separator
        output += options[:item_style].gsub(/\[link\]/, link_to(key ,display_path(id)))
        if separator == ''
          separator= options[:item_separator]
        end
    end
      output = options[:group_style].gsub(/\[items\]/, output)
      output = output.gsub(/\[active\]/, output)

      return output.html_safe
    end
    def paginas_menu_helper_by_cat(catid,options = {})
      options[:item_style] ||= "[link]"
      options[:item_separator] ||= " | "
      options[:group_style] ||= "[items]"
      options[:active_class] ||= ""

      output = ''
      separator = ''
      Category.find(catid).pages.each do |page|
        output += separator
        output += options[:item_style].gsub(/\[link\]/, link_to(page.title ,display_path(page.id)))
        if separator == ''
          separator= options[:item_separator]
        end
      end
      output = options[:group_style].gsub(/\[items\]/, output)
      output = output.gsub(/\[active\]/, output)

      return output.html_safe
    end

    def method_missing(method, *args, &block)
      if (method.to_s.end_with?('_path') || method.to_s.end_with?('_url')) && main_app.respond_to?(method)
        main_app.send(method, *args)
      else
        super
      end
    end
  end
end
