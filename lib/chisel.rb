class Chisel
  def initialize(markdown)
    @markdown = markdown
  end

  def to_html
   @markdown.reverse
  end
end
# Let there be a markdown parser
# read the md file
markdown_file = ARGV[0]
html_file = ARGV[1]
markdown = File.read(markdown_file)
# make it html
html = Chisel.new(markdown).to_html
# write it to the html file
File.write(html_file, html)
# print summary
markdown_lines = markdown_file.lines
html_lines     = html_file.html.lines 
p "Converted my_input.markdown (#{markdown_lines} lines) to my_output.html (#{html_lines} lines)"
