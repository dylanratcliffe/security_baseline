require 'spec_helper'

describe 'security_baseline::rules::sec_issue' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" dolet(:facts) do
      os_facts.merge(
        'issue' => 1234,
      )
    end
    let(:params) do
      {
        'enforce' => true,
        'message' => 'motd configuration',
        'loglevel' => 'warning',
      }
    endlet(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
