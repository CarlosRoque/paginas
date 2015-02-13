require 'rails/generators/base'

module Paginas
  module Generators
    # Include this module in your generator to generate paginas views.
    # `copy_views` is the main method and by default copies all views
    # with forms.
    module ViewPathTemplates #:nodoc:
      extend ActiveSupport::Concern

      included do
        argument :scope, required: false, default: nil,
                         desc: "The scope to copy views to"

        # Le sigh, ensure Thor won't handle opts as args
        # It should be fixed in future Rails releases
        class_option :form_builder, aliases: "-b"
        class_option :markerb
        class_option :views, aliases: "-v", type: :array, desc: "Select specific view directories to generate (pages)"

        public_task :copy_views
      end

      # TODO: Add this to Rails itself
      module ClassMethods
        def hide!
          Rails::Generators.hide_namespace self.namespace
        end
      end

      def copy_views
        if options[:views]
          options[:views].each do |directory|
            view_directory directory.to_sym
          end
        else
          view_directory :pages
          view_directory :categories
        end
      end

      protected

      def view_directory(name, _target_path = nil)
        directory name.to_s, _target_path || "#{target_path}/#{name}" do |content|
          if scope
            content.gsub "paginas/shared/links", "#{scope}/shared/links"
          else
            content
          end
        end
      end

      def target_path
        @target_path ||= "app/views/#{scope || :paginas}"
      end
    end

    class SharedViewsGenerator < Rails::Generators::Base #:nodoc:
      include ViewPathTemplates
      source_root File.expand_path("../../../../app/views/paginas", __FILE__)
      desc "Copies shared Paginas views to your application."
      hide!

      # Override copy_views to just copy mailer and shared.
      def copy_views
        # view_directory :shared
      end
    end

    class FormForGenerator < Rails::Generators::Base #:nodoc:
      include ViewPathTemplates
      source_root File.expand_path("../../../../app/views/paginas", __FILE__)
      desc "Copies default Paginas views to your application."
      hide!
    end

    class ViewsGenerator < Rails::Generators::Base
      desc "Copies Paginas views to your application."

      argument :scope, required: false, default: nil,
                       desc: "The scope to copy views to"

      invoke SharedViewsGenerator

      hook_for :form_builder, aliases: "-b",
                              desc: "Form builder to be used",
                              default: defined?(SimpleForm) ? "simple_form_for" : "form_for"

    end
  end
end
