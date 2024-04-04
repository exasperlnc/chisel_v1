require './lib/chisel'
require 'minitest/autorun'

class TestChisel < Minitest::Test 
  def test_markdown_to_html
    skip 
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

  def test_header_wrap
    markdown_chunk = ("## This should skip the last # ")
    expected_html = '<h2>This should skip the last # </h2>'
    output_html = Chisel.new("").header_wrap(markdown_chunk)
    assert_equal expected_html, output_html
  end

  def test_paragraph_wrap 
    markdown = "Yeetus mc fleetus my guy"
    expected_html = "<p>\n  Yeetus mc fleetus my guy\n</p>"
    output_html = Chisel.new("").paragraph_wrap(markdown)
    assert_equal expected_html, output_html
  end

  def test_chunks_to_string
    markdown_chunks = ["## this is a header", "### this is a smaller header", "This is not a header", "neither is this"]
    output_html = Chisel.new("").chunks_to_string(markdown_chunks)
    expected_html = "<h2>this is a header</h2>\n\nthis is a smaller header\n\n<p>\nThis is not a header\n</p>\n\n<p>\nneither is this\n</p>"
    assert_equal expected_html, output_html 
  end
end