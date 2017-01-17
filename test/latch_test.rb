require 'test/unit'
require 'thread'
require 'latch'

class LatchTest < Test::Unit::TestCase
  test 'basic latch countdown test' do
    latch = Latch::CountDown.new(1)
    name = 'hoge'
    Thread.new do
      latch.await
      assert_equal(0, latch.count)
      assert_equal('huga', name)
    end
    name = 'huga'
    latch.count_down
  end

  test 'basic latch countdown test 2' do
    latch = Latch::CountDown.new(2)
    name = 'hoge'
    Thread.new do
      latch.count_down
      assert_equal('hoge', name)
      latch.count_down
      name = 'huga'
    end
    latch.await
    assert_equal(0, latch.count)
    assert_equal('huga', name)
  end

  test 'basic latch bool test' do
    latch = Latch::Bool.new
    name = 'hoge'
    Thread.new do
      latch.await
      assert_equal('huga', name)
    end
    name = 'huga'
    latch.start
  end
end
