# frozen_string_literal: true

# aide_version.rb
# Ensures that aide is installed and create a fact with the version
Facter.add('aide_version') do
  confine :odfamily => 'RedHat'
  # This doesn't need a do end block, could just pass the string to setcode
  setcode do
    Facter::Core::Execution.exec("rpm -q --queryformat '%{version}' aide")
  end
end
