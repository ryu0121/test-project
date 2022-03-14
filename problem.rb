# 家志　隆平(かし　りゅうへい)

class InRangeCalculator
    def self.call(time:, from:, to:)
        new(time: time, from: from, to: to).call
    end

    def initialize(time:, from:, to:)
        @time = time
        @range = {from: from, to: to}
    end

    def call
        # MEMO: さらに分岐が増えそうだったらStorategyパターンを検討
        if range[:from] > range[:to]
            temporary_range = {from: range[:from], to: END_TIME}
            result = in_range?(time: time, range: temporary_range)
            return result if result

            temporary_range = {from: START_TIME, to: range[:to]}
            in_range?(time: time, range: temporary_range)
        else
            in_range?(time: time, range: range)
        end
    end

    private

    START_TIME = 0
    END_TIME = 24

    def in_range?(time:, range:)
        return range[:from] == time && time == range[:to] if range[:from] == range[:to]
        range[:from] <= time && time < range[:to]
    end

    private attr_reader :time, :range
end

line = readlines
len = line.length
i = 0

while i < len
    line[i] = line[i].chomp
    i += 1
end

time = line[0].to_i
from = line[1].split(',').first.to_i
to = line[1].split(',').last.to_i

result = InRangeCalculator.call(time: time, from: from, to: to)

puts result