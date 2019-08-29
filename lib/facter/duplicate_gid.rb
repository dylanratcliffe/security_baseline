# frozen_string_literal: true

# duplicate_gid.rb
# Ensures there are no duplicate GIDs in /etc/group
Facter.add('duplicate_gid') do
  confine :kernel => 'Linux'
  setcode do
    groups = ''
    if File.exists?('/etc/group')
      groupdata = {}
      lines = File.open('/etc/group').readlines()
      lines.each do |line|
        next if line =~/^#/
        data = line.split(/:/)
        group = data[0]
        gid = data[2]
        if groupdata.key?(gid) then
          groupdata[gid][:cnt] = groupdata[gid]['cnt'] + 1
          groupdata[gid][:group] = "#{groupdata[gid][:group]};#{group}"
        else
          groupdata[gid] = {:cnt => 1, :group => group}
        end
      end 
      groupdata.each do |gid, value|
        if value[:cnt] > 1 then
            groups = "Duplicate gid #{gid} groups: #{value[:group]}"
        end
      end

    end
    
    groups
  end
end