# frozen_string_literal: true

# dccp.rb
# Check if dccp module is present

Facter.add('net_dccp') do
  confine :kernel => 'Linux'
  setcode do
    installed = Facter::Core::Execution.exec('lsmod | grep dccp')
    if installed.empty?
      false
    else
      true
    end
  end
end
  