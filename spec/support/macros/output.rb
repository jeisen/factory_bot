module SilenceOutput
  def with_silenced_output(&block)
    cached_stderr = $stderr
    cached_stdout = $stdout
    $stderr = File.new(File::NULL, "w")
    $stdout = File.new(File::NULL, "w")
    yield block
    $stdout = cached_stdout
    $stderr = cached_stderr
  end

  def silence_output(example)
    with_silenced_output do
      example.run
    end
  end
end


RSpec.configure do |config|
  config.include SilenceOutput

  config.around :example, silence_output: true do |example|
    silence_output(example)
  end
end
