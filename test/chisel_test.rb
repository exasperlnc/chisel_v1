require './lib/chisel'
require 'minitest/autorun'

class TestChisel < Minitest::Test 
  def test_markdown_to_html
    markdown = '# My Life in Desserts

    ## Chapter 1: The Beginning
    
    "You just *have* to try the cheesecake," he said. "Ever since it appeared in
    **Food & Wine** this place has been packed every night."'

    expected_html = '<h1>My Life in Desserts</h1>

    <h2>Chapter 1: The Beginning</h2>
    
    <p>
      "You just <em>have</em> to try the cheesecake," he said. "Ever since it appeared in
      <strong>Food &amp; Wine</strong> this place has been packed every night."
    </p>'

    output_html = Chisel.new(markdown).to_html
    assert_equal expected_html, output_html
  end
end