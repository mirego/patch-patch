require 'patch_patch/version'

# Activesupport
require 'active_support'
require 'active_support/core_ext/module/aliasing'

# ActionDispatch
require 'action_dispatch/routing'
require 'action_dispatch/routing/route_set'

module ActionDispatch::Routing::Mapper::Resources
  def resources_with_patch_fix(*resources, &block)
    resources_without_patch_fix(*resources) do
      yield if block_given?
      patch '/', on: :member, action: :partial_update if parent_resource.actions.include?(:partial_update)
    end
  end
  alias_method_chain :resources, :patch_fix

  class Resource
    def default_actions
      [:index, :create, :new, :show, :update, :partial_update, :destroy, :edit]
    end
  end
end
