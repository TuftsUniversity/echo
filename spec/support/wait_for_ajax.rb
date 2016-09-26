module Support
  def wait_for_ajax(timeout = Capybara.default_max_wait_time)
    Timeout.timeout(timeout) do
      page.evaluate_script 'jQuery.active == 0'
    end
  end
end