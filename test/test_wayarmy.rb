require 'minitest/autorun'
require 'wayarmy'
require 'webmock/minitest'

class WayarmyTest < Minitest::Test
  def setup
    @r = Wayarmy::Main.new()
    stub_request(:any, "https://gitlab.com").to_return(
      :status => 302
    )
  end
  def test_request_code_200
    stub_request(:any, "https://gitlab.com").to_return(
        :status => 200
      )
    assert_equal 200,
      @r.request
  end

  def test_request_code_diferrent_200
    @r.request
    assert_equal 302, @r.request
  end

  def test_response_time_greate_than_0
    assert_operator @r.get_response_time, :>, 0
  end

  def test_output_contain_response_and_response_time_appear_6_times
    $stdout = StringIO.new
    @r.start
    string = $stdout.string
    times_appears = string.scan(/(?=#{"Response Time:"})/).count
    assert_match /Response code: 302/, string
    assert_match /Response Time:/, string
    assert_match /Response Time average:/, string
    assert_equal 6, times_appears
  end

  def test_command_will_run_in_60s
    begin_time = Time.now.to_i
    @r.start
    complete_time = Time.now.to_i - begin_time

    assert_operator complete_time, :>=, 60
  end
end