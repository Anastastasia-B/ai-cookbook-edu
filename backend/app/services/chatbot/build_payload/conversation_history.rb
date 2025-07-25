module Chatbot
  module BuildPayload
    class ConversationHistory
      include Callable

      def initialize(conversation:)
        @conversation = conversation
      end

      def call
        conversation_turns
          .limited_for_gemini_api
          .map(&:payload)
      end

      private

      attr_reader :conversation

      def conversation_turns
        conversation.conversation_turns
      end
    end
  end
end
