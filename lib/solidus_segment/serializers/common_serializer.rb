# frozen_string_literal: true

module SolidusSegment
  module Serializers
    class CommonSerializer
      def initialize(user: nil, request: nil)
        @user = user
        @request = request
      end

      def to_h
        parameters = {}
        parameters[:user_id] = user&.id

        if request
          parameters[:anonymous_id] = anonymous_id
          parameters[:integrations] = common_integrations
        end

        parameters.compact
      end

      private

      attr_reader :user, :request

      def common_integrations
        integrations = {}
        integrations["Google Analytics"] = { clientId: client_id } if client_id
        integrations.empty? ? nil : integrations
      end

      def anonymous_id
        request.session_options[:id]
      end

      def client_id
        request.cookies["_ga"]&.gsub(/^GA\d\.\d\./, '')
      end
    end
  end
end