require 'spec_helper'

describe PatchPatch do
  let(:routes) { ActionDispatch::Routing::RouteSet.new }
  let(:custom_route) { { controller: 'users', action: 'partial_update', method: 'PATCH' } }
  let(:route_details) do
    routes.routes.routes.map do |route|
      {
        controller: route.defaults[:controller],
        action: route.defaults[:action],
        method: route.constraints[:request_method].source.gsub(/[^A-Z]+/, '')
      }
    end
  end

  context 'with all default actions' do
    before do
      routes.draw { resources :users }
    end

    it { expect(route_details.first).to eql(custom_route) }
  end

  context 'with `partial_update` removed from actions' do
    before do
      routes.draw { resources :users, except: [:partial_update] }
    end

    it { expect(route_details).to_not include(custom_route) }
  end
end
