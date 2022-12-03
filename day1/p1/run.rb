require '../../common/base.rb'
lines = Input.get_file_lines

max_elve_val = 0
current_elve = 0
lines.each_with_index do |value,index|
    if(value.blank? || index == lines.length - 1)
        if(current_elve > max_elve_val)
            max_elve_val = current_elve
        end
        current_elve = 0
        next
    end

    current_elve += value.to_i
end

puts max_elve_val
