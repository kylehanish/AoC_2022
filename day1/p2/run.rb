require '../../common/base.rb'
lines = Input.get_file_lines

current_elve = 0
mapping = {}
lines.each_with_index do |value,index|
    if(value.blank? || index == lines.length - 1)
        mapping[(mapping.keys.length + 1).to_s] = current_elve 
        current_elve = 0
        next
    end
    
    current_elve += value.to_i
end

puts mapping.values.sort.last(3).sum