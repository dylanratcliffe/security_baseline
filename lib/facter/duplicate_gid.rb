# frozen_string_literal: true

# duplicate_gid.rb
# Ensures there are no duplicate GIDs in /etc/group
Facter.add('duplicate_gid') do
  confine :kernel => 'Linux'

  # Many of these facts are the same, it is actually possible to write
  # re-usable libraries that facts can share and that is probably what
  # should be done here. It's pretty advanced though, usually you see these
  # live under the puppet_x directory
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
