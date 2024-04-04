class Chisel
  def initialize(markdown)
    @markdown = markdown
  end

  def to_html
    # separate the markdown into chunks
    md_chunks = @markdown.split(/\n\n+/)
    # iterate through the chunks and convert them to html
    chunk_array = md_chunks.map do |chunk|
      chunk_to_html(chunk)
    # combine back into one string
    end
    chunks_to_string(chunk_array)
  end

  def chunk_to_html(chunk)
    # if chunk starts with # do the header method
    if chunk[0] == '#'
      header_wrap(chunk)
    # else wrap with <p>
    else
      paragraph_wrap(chunk)
    end
  end

  def header_wrap(chunk)
    first_char = chunk.index(' ') + 1
    level = chunk[0...first_char].count('#')
    "<h#{level}>#{chunk[first_char..-1]}</h#{level}>"
  end
end
# Let there be a markdown parser
# read the md file
program_running = ($PROGRAM_NAME == __FILE__)
if program_running
  markdown_file = ARGV[0]
  html_file = ARGV[1]
  markdown = File.read(markdown_file)
  # make it html
  html = Chisel.new(markdown).to_html
  # write it to the html file
  File.write(html_file, html)
  # print summary
  markdown_lines = markdown.lines.count
  html_lines     = html.lines.count
  p "Converted my_input.markdown (#{markdown_lines} lines) to my_output.html (#{html_lines} lines)"
end