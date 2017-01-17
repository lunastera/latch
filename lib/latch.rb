require 'latch/version'
require 'thread'

module Latch
  # Common Initializer
  class Base
    def initialize
      @lock = Mutex.new
      @condition = ConditionVariable.new
    end
  end

  # It is a type that operates after countdown
  class CountDown < Base
    attr_reader :count

    def initialize(count)
      @count = count.to_i
      raise ArgumentError, 'only argument is Integer' unless @count >= 0
      super()
    end

    def count_down
      @lock.synchronize do
        @count -= 1 if @count > 0
        @condition.broadcast if @count.zero?
      end
    end

    def await
      @lock.synchronize do
        @condition.wait(@lock) while @count > 0
      end
    end
  end

  class Bool < Base
    attr_reader :flag

    def initialize
      super()
      @flag = false
    end

    def start
      @lock.synchronize do
        @flag = true
        @condition.broadcast
      end
    end

    def await
      @lock.synchronize do
        @condition.wait(@lock) while @flag
      end
    end
  end
end
