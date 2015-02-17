module Paginas
  class Engine < ::Rails::Engine
    isolate_namespace Paginas
    initializer 'paginas.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Paginas::ApplicationHelper
      end
    end
  end
end
