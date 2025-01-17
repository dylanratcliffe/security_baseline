# frozen_string_literal: true

# tmp_partition.rb
# Makes sure that /tmp is mounted

Facter.add('tmp_partition') do
  confine :kernel => 'Linux'
  setcode 'mount | grep /tmp'
end