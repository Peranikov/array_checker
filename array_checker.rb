class ArrayChecker
  def initialize(path, range = 1..10000)
    @array = convert_to_array(path)
    @range_sum = range.reduce(:+) # 1..10000固定であれば50005000の定数で良い
  end

  def find_not_exist_number
    @range_sum - @array.reduce(:+)
  end

  private

  def convert_to_array(path)
    file = File.read(path)
    begin
      ruby_obj = eval(file)
      raise unless ruby_obj.is_a? Array
      ruby_obj
    rescue
      raise ArgumentError, "#{path} is not Array"
    end
  end
end
