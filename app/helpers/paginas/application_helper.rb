module Paginas
  module ApplicationHelper
    def paginas_menu_helper_by_pages(ids,options = {})
      options[:item_style] ||= "[link]"
      options[:item_separator] ||= " | "
      options[:group_style] ||= "[items]"
      options[:active_class] ||= ""
      options[:controller] ||= 'paginas/pages'
      options[:action] ||= 'display'

      output = ''
      separator = ''
      ids.each do |key,id|
        item = ''
        item += separator
        item += options[:item_style].gsub(/\[link\]/, link_to(key ,display_path(id)))

        active = ''
        if params[:controller] == options[:controller] && params[:action] == options[:action] && params[:id] == id.to_s
          active = options[:active_class]
        end
        item = item.gsub(/\[active\]/, active)
        output += item

        if separator == ''
          separator= options[:item_separator]
        end
    end
      output = options[:group_style].gsub(/\[items\]/, output)

      return output.html_safe
    end
    def paginas_menu_helper_by_cat(catid,options = {})
      options[:item_style] ||= "[link]"
      options[:item_separator] ||= " | "
      options[:group_style] ||= "[items]"
      options[:active_class] ||= ""
      options[:controller] ||= 'paginas/pages'
      options[:action] ||= 'display'

      output = ''
      separator = ''
      cats = Category.where(:id => catid).first
      if !cats.blank?
        cats.pages.each do |page|
          item = ''
          item += separator
          item += options[:item_style].gsub(/\[link\]/, link_to(page.title ,display_path(page.id)))

          active = ''
          if params[:controller] == options[:controller] && params[:action] == options[:action] && params[:id] == page.id.to_s
            active = options[:active_class]
          end
          item = item.gsub(/\[active\]/, active)
          output += item
          if separator == ''
            separator= options[:item_separator]
          end
        end
      end
      output = options[:group_style].gsub(/\[items\]/, output)

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
